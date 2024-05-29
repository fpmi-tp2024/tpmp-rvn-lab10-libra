////  Registration.swift
//  Foodie//
//  Created by Алина on 24.05.24.//
import SwiftUI
import CryptoKit

struct SecureTextField: View {
    @State private var isSecureField: Bool = true
    @Binding var text: String
    var body: some View {
        if #available(iOS 15.0, *) {
            HStack {
                if isSecureField {
                    SecureField("lPassword", text: $text)
                        .accessibility(identifier: "PasswordField")
                    
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

struct Registration: View {
    @AppStorage("isDarkTheme") var isDarkTheme: Bool = false
    @Environment(\.presentationMode) var presentationMode
    @State private var email = ""
    @State private var login = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var isPasswordInputSecure = true
    @State private var isConfirmPasswordInputSecure = true
    @State private var isInputValid = false
    @State private var showAlert = false
    @State public var isVisible = true
    @Binding var isLogged: Bool
    
    var body: some View {
        NavigationView {
        VStack(spacing: 20) {
            Spacer()
            VStack(alignment: .leading, spacing: 5) {
                Text("tELogin")
                    .font(.headline)
                    .foregroundColor(Color.blue)
                TextField("tLogin", text: $login)
                    .padding()
                    .cornerRadius(10)
                    .border(Color.blue, width: 1)
                    .accessibility(identifier: "LoginField")
                
            }
            VStack(alignment: .leading, spacing: 5) {
                Text("tEEmail")
                    .font(.headline)
                    .foregroundColor(Color.blue)
                TextField("lEmail", text: $email)
                    .padding()
                    .cornerRadius(10)
                    .border(Color.blue, width: 1)
                    .accessibility(identifier: "EmailField")
                
            }
            VStack(alignment: .leading, spacing: 5) {
                Text("tEPassword")
                    .font(.headline)
                    .foregroundColor(Color.blue)
                SecureTextField(text: $password)
                    .padding()
                    .cornerRadius(10)
                    .border(Color.blue, width: 1)
                
            }
            VStack(alignment: .leading, spacing: 5) {
                Text("lConfirm")
                    .font(.headline)
                    .foregroundColor(Color.blue)
                SecureTextField(text: $confirmPassword)
                    .padding()
                    .cornerRadius(10)
                    .border(Color.blue, width: 1)
                    .accessibility(identifier: "ConfirmPasswordField")
            }
            VStack() {
                Spacer()
                Button(action: {
                    if (!email.isEmpty && !login.isEmpty && !password.isEmpty && !confirmPassword.isEmpty && password == confirmPassword) {
                        
                        UserDefaults.standard.setValue(email, forKey: "email")
                        UserDefaults.standard.setValue(login, forKey: "login")
                        UserDefaults.standard.setValue(password, forKey: "password")
                        isInputValid = true
                        showAlert = false
                        
                        self.presentationMode.wrappedValue.dismiss()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            isLogged = true
                        }
                    }
                    else {
                        isInputValid = false
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
        }        .padding()
        
            .alert(isPresented: $showAlert) {
                Alert(title: Text("tErr"), message: Text("alert1"), dismissButton: .default(Text("tok")))
                    
            }
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
            
    struct Registration_Previews: PreviewProvider {
        static var previews: some View {
            Registration(isLogged: .constant(false))
            
        }
            
    }
