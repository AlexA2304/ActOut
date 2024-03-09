//
//  User.swift
//  ActOut
//
//  Created by Alex Archer on 8/17/23.
//

import Foundation
import Firebase

struct User: Identifiable, Codable, Hashable {
    let id: String
    var username: String
    var profileImageUrl: String?
    var fullname: String?
    var bio: String?
    let email: String
    
    var isFollowed: Bool? = false
    var stats: UserStats?
    
    var isCurrentUser: Bool {
        guard let currentUid = Auth.auth().currentUser?.uid else { return false }
        return currentUid == id
    }
}

struct UserStats: Codable, Hashable {
    var followingCount: Int
    var followersCount: Int
    var postsCount: Int
}

extension User {
    static var MOCK_USERES: [User] = [
        .init(id: NSUUID().uuidString, username: "AlexArcher", profileImageUrl: nil, fullname: "Alex Archer", bio: "Founding Father @ ActOut", email: "alexander.archer2300@gmail.com"),
        .init(id: NSUUID().uuidString, username: "MadisonRoland", profileImageUrl: nil, fullname: "Madison Roland", bio: "First Lady", email: "madisonroland014@gmail.com"),
        .init(id: NSUUID().uuidString, username: "ShawnKlemme", profileImageUrl: nil, fullname: "Shawn Klemme", bio: "Founding Father @ ActOut", email: "ShawnKlemme@gmail.com")
    ]
}
