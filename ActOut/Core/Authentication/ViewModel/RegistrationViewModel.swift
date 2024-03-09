//
//  RegistrationViewModel.swift
//  ActOut
//
//  Created by Alex Archer on 8/17/23.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    @Published var username = ""
    @Published var email = ""
    @Published var password = ""
    
    @MainActor
    func createUser() async throws {
        try await AuthService.shared.createUser(email: email, password: password, username: username)
        
        await MainActor.run {
            username = ""
            password = ""
            email = ""
        }
    }
}
