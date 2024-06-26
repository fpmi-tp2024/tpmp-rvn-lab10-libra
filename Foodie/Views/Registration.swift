//
//  Registration.swift
//  Foodie
//
//  Created by Алина on 24.05.24.
//

import SwiftUI

// MARK: - Registration Page View

struct Registration: View {
    @AppStorage("isDarkTheme") var isDarkTheme: Bool = false
    @Environment(\.presentationMode) var presentationMode
    @State private var isPasswordInputSecure = true
    @State private var isConfirmPasswordInputSecure = true
    @State private var showAlert = false
    @State public var isVisible = true
    @Binding var isLogged: Bool
    @ObservedObject private var registrationViewModel = RegistrationViewModel()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                // MARK: - Registration View inner contents
                
                Spacer()
                VStack(alignment: .leading, spacing: 5) {
                    Text("tELogin")
                        .font(.headline)
                        .foregroundColor(Color.blue)
                    TextField(NSLocalizedString("tLogin", comment: ""), text: $registrationViewModel.login)
                        .padding()
                        .cornerRadius(10)
                        .border(Color.blue, width: 1)
                        .accessibility(identifier: "LoginField")
                    
                }
                VStack(alignment: .leading, spacing: 5) {
                    Text("tEEmail")
                        .font(.headline)
                        .foregroundColor(Color.blue)
                    TextField(NSLocalizedString("lEmail", comment: ""), text: $registrationViewModel.email)
                        .padding()
                        .cornerRadius(10)
                        .border(Color.blue, width: 1)
                        .accessibility(identifier: "EmailField")
                    
                }
                VStack(alignment: .leading, spacing: 5) {
                    Text("tEPassword")
                        .font(.headline)
                        .foregroundColor(Color.blue)
                    SecureTextField(text: $registrationViewModel.password)
                        .padding()
                        .cornerRadius(10)
                        .border(Color.blue, width: 1)
                        .accessibility(identifier: "PasswordField")
                    
                }
                VStack(alignment: .leading, spacing: 5) {
                    Text("lConfirm")
                        .font(.headline)
                        .foregroundColor(Color.blue)
                    SecureTextField(text: $registrationViewModel.confirmPassword)
                        .padding()
                        .cornerRadius(10)
                        .border(Color.blue, width: 1)
                        .accessibility(identifier: "ConfirmPasswordField")
                }
                VStack() {
                    Spacer()
                    Button(action: {
                        if (registrationViewModel.isRegistrationCorrect()) {
                            showAlert = false
                            
                            self.presentationMode.wrappedValue.dismiss()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                isLogged = true
                            }
                        }
                        else {
                            showAlert = true
                        }
                    }) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 50)
                                .foregroundColor(.green)
                            Text("bConfirm")
                                .foregroundColor(.white)
                                .bold()
                                .accessibility(identifier: "ConfirmButton")
                        }
                    }
                    .frame(width: 200, height: 40)
                }
            }
            .padding()
            .alert(isPresented: $showAlert) {
                Alert(title: Text("tErr"), message: Text("alert1"), dismissButton: .default(Text("tok")))
            }
            
            // MARK: - Registration View toolbar
            
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                        Text("bBack")
                    }
                }
            }
        }
        .environment(\.colorScheme, isDarkTheme ? .dark : .light)
    }
}
      
// MARK: - Registration Page Preview

struct Registration_Previews: PreviewProvider {
    static var previews: some View {
        Registration(isLogged: .constant(false))
    }
}
