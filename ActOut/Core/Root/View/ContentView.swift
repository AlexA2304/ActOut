//
//  ContentView.swift
//  ActOut
//
//  Created by Alex Archer on 8/16/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    @StateObject var registrationViewModel = RegistrationViewModel()
    
    var body: some View {
        Group {
            if viewModel.userSession == nil {
                LoginView()
                    .environmentObject(registrationViewModel)
            } else if let currentUser = viewModel.currentUser {
                MainTabView(user: currentUser)
            } else {
                VStack {
                    Spacer()
                    
                    Image("logo-dark")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 230, height: 100)
                    
                    Spacer()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
