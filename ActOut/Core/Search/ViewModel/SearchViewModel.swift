//
//  SearchViewModel.swift
//  ActOut
//
//  Created by Alex Archer on 8/18/23.
//

import Foundation

class SearchViewModel: ObservableObject {
    @Published var users = [User]()
    
    init() {
        Task { try await fetchAllUsers() }
    }
    
    @MainActor
    func fetchAllUsers() async throws {
        self.users = try await UserService().fetchAllButActive()
    }
}
