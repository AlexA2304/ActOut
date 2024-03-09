//
//  UserService.swift
//  ActOut
//
//  Created by Alex Archer on 8/18/23.
//

import Foundation
import Firebase


class UserService {
    
    @Published var currentUser: User?
    
    static let shared = UserService()
    
    @MainActor
    func fetchCurrentUser() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        self.currentUser = try await FirebaseConstants.UsersCollection.document(uid).getDocument(as: User.self)
    }
    
    static func fetchUser(withUid uid: String) async throws -> User {
        let snapshot = try await FirebaseConstants.UsersCollection.document(uid).getDocument()
        return try snapshot.data(as: User.self)
    }
    
    @MainActor
    func fetchAllUsers() async throws -> [User] {
        let snapshot = try await FirebaseConstants.UsersCollection.getDocuments()
        return snapshot.documents.compactMap({ try? $0.data(as: User.self) })
    }
    
    @MainActor
    func fetchAllButActive() async throws -> [User] {
        let snapshot = try await FirebaseConstants.UsersCollection.getDocuments()
        let users = snapshot.documents.compactMap({ try? $0.data(as: User.self) })
        return users.filter { !$0.isCurrentUser }
    }
}

// Following
extension UserService {
    
    static func follow(uid: String) async throws {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        
        async let _ = try await FirebaseConstants.FollowingCollection.document(currentUid).collection("user-following").document(uid).setData([:])
        
        async let _ = try await FirebaseConstants.FollowersCollection.document(uid).collection("user-followers").document(currentUid).setData([:])
    }
    
    static func unfollow(uid: String) async throws {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        
        async let _ = try await FirebaseConstants.FollowingCollection.document(currentUid).collection("user-following").document(uid).delete()
        
        async let _ = try await FirebaseConstants.FollowersCollection.document(uid).collection("user-followers").document(currentUid).delete()
    }
    
    static func checkIfUserIsFollowed(uid: String) async throws -> Bool {
        guard let currentUid = Auth.auth().currentUser?.uid else { return false }
        
        let snapshot = try await FirebaseConstants.FollowingCollection.document(currentUid).collection("user-following").document(uid).getDocument()
        
        return snapshot.exists
    }
    
}

// User Stats

extension UserService {
    static func fetchUserStats(uid: String) async throws -> UserStats {
        async let followingSnapshot = try await FirebaseConstants.FollowingCollection.document(uid).collection("user-following").getDocuments()
        let followingCount = try await followingSnapshot.count
        print("\(followingCount)")
        async let followersSnapshot = try await FirebaseConstants.FollowingCollection.document(uid).collection("user-followers").getDocuments()
        let followerCount = try await followersSnapshot.count
        print("\(followerCount)")
        async let postSnapshot = try await FirebaseConstants.PostsCollection.whereField("ownerUid", isEqualTo: uid).getDocuments()
        let postsCount = try await postSnapshot.count
        
        return .init(followingCount: followingCount, followersCount: followerCount, postsCount: postsCount)
    }
}
