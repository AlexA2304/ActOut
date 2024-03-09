//
//  DeveloperPreview.swift
//  ActOut
//
//  Created by Alex Archer on 8/24/23.
//

import Firebase
import SwiftUI

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.shared
    }
}

class DeveloperPreview {
    static let shared = DeveloperPreview()
    
    let comment = Comment(postOwnerUid: "123", commentText: "Hello", postId: "3214", timestamp: Timestamp(), commentOwnerUid: "129083204")
}
