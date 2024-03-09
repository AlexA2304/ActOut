//
//  Post.swift
//  ActOut
//
//  Created by Alex Archer on 8/17/23.
//

import Foundation
import Firebase

struct Post: Identifiable, Hashable, Codable {
    let id: String
    let ownerUid: String
    let caption: String
    var likes: Int
    let imageUrl: String
    let timestamp: Timestamp
    var user: User?
    
    var didLike: Bool? = false
}

extension Post {
    static let MOCK_IMAGE_URL = "https://firebasestorage.googleapis.com:443/v0/b/actout-471be.appspot.com/o/profule_images%2FDCB8A80E-3E19-4939-98DA-55982DB88C0D?alt=media&token=7fe2069d-85f1-4719-bf53-18eb9d3d06f4"
    
    static var MOCK_POSTS: [Post] = [
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption:"First Post", likes: 0, imageUrl: MOCK_IMAGE_URL, timestamp: Timestamp(), user: User.MOCK_USERES[0]),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption:"Second Post", likes: 0, imageUrl: "madison-profile", timestamp: Timestamp(), user: User.MOCK_USERES[1]),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption:"Third Post", likes: 0, imageUrl: "shawn-profile", timestamp: Timestamp(), user: User.MOCK_USERES[2]),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption:"Fourth Post", likes: 0, imageUrl: "NoPicture", timestamp: Timestamp(), user: User.MOCK_USERES[0]),
        .init(id: NSUUID().uuidString, ownerUid: NSUUID().uuidString, caption:"Fifth Post", likes: 0, imageUrl: "logo-dark", timestamp: Timestamp(), user: User.MOCK_USERES[1]),
    ]
}
