//
//  SecureTextFieldView.swift
//  Foodie
//
//  Created by Vasily on 29.05.24.
//

import SwiftUI

struct SecureTextField: View {
    @State private var isSecureField: Bool = true
    @Binding var text: String
    
    var body: some View {
        if #available(iOS 15.0, *) {
            HStack {
                if isSecureField {
                    SecureField("lPassword", text: $text)
                    
                } else {
                    TextField("tPassword", text: $text)
                    
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
