//
//  CurrentUserProfileVIew.swift
//  ActOut
//
//  Created by Alex Archer on 8/17/23.
//

import SwiftUI

struct CurrentUserProfileView: View {
    
    let user: User
    
    var body: some View {
        NavigationStack {
            ScrollView {
                    // header
                    ProfileHeaderView(user: user)
                    
                    //post grid view
                    PostGridView(user: user)
                }
                .navigationTitle("Profile")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            AuthService.shared.signout()
                        } label: {
                            Image(systemName: "line.3.horizontal")
                                .foregroundColor(.black)
                    }
                }
            }
        }
    }
}

struct CurrentUserProfileVIew_Previews: PreviewProvider {
    static var previews: some View {
        CurrentUserProfileView(user: User.MOCK_USERES[0])
    }
}
