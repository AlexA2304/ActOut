//
//  AOTextFieldModifier.swift
//  ActOut
//
//  Created by Alex Archer on 8/17/23.
//

import SwiftUI

struct AOTextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal, 24)
    }
}
