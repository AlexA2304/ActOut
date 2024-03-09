//
//  LoginViewModel.swift
//  ActOut
//
//  Created by Alex Archer on 8/18/23.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    func signIn() async throws {
        try await AuthService.shared.login(withEmail: email, password: password)
    }
}
