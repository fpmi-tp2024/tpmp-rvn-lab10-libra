//
//  Login.swift
//  Foodie
//
//  Created by Алина on 24.05.24.
//

import SwiftUI

// MARK: - Login Page View

struct Login: View {
    @AppStorage("isDarkTheme") var isDarkTheme: Bool = false
    @State private var isPasswordInputSecure = true
    @State private var showAlert = false
    @Binding var isLogged: Bool
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var loginViewModel = LoginViewModel()
    
    var body: some View {
        NavigationView {
            
            VStack(spacing: 20) {
                // MARK: - Login View inner contents
                
                Spacer()

                VStack(alignment: .leading, spacing: 5) {
                    Text("tELogin")
                        .font(.headline)
                        .foregroundColor(Color.blue)
                    TextField(NSLocalizedString("tLogin", comment: ""), text: $loginViewModel.login)
                        .padding()
                        .cornerRadius(10)
                        .border(Color.blue, width: 1)
                        .accessibility(identifier: "LoginField")
                }

                VStack(alignment: .leading, spacing: 5) {
                    Text("tEPassword")
                        .font(.headline)
                        .foregroundColor(Color.blue)
                    SecureTextField(text: $loginViewModel.password)
                        .padding()
                        .cornerRadius(10)
                        .border(Color.blue, width: 1)
                        .accessibility(identifier: "PasswordField")
                }
                
                VStack() {
                    Spacer()
                    Button(action: {
                        if (loginViewModel.isLoginCorrect()) {
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
                            Text("lConfirm")
                                .foregroundColor(.white)
                                .bold()
                        }
                    }
                    .frame(width: 200, height: 40)
                    .accessibility(identifier: "ConfirmButton")
                }
            }
            .padding()
            .alert(isPresented: $showAlert) {
                Alert(title: Text("tErr"), message: Text("alert3"), dismissButton: .default(Text("tok")))
            }
            // MARK: - Login View toolbar
            
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

// MARK: - Login Page Preview

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login(isLogged: .constant(false))
    }
}
