//
//  SecureTextFieldView.swift
//  Foodie
//
//  Created by Vasily on 29.05.24.
//

import SwiftUI

// MARK: - Secure Text Field View

struct SecureTextField: View {
    @State private var isSecureField: Bool = true
    @Binding var text: String
    
    var body: some View {
        if #available(iOS 15.0, *) {
            HStack {
                if isSecureField {
                    SecureField(NSLocalizedString("lPassword", comment: ""), text: $text)
                    
                } else {
                    TextField(NSLocalizedString("tPassword", comment: ""), text: $text)
                    
                }
            }.overlay(alignment: .trailing) {
                Image(systemName: isSecureField ? "eye.slash": "eye")
                    .onTapGesture {
                        isSecureField.toggle()
                    }
            }
            
        } else {
            // Fallback on earlier versions
        }
    }
}
