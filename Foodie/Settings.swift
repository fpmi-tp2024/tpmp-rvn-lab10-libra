//
//  Settings.swift
//  Foodie
//
//  Created by Алина on 24.05.24.
//

import SwiftUI

struct Settings: View {
    
    @AppStorage("isDarkTheme") var isDarkTheme: Bool = false
    @State private var email = ""
    @State private var login = ""
    @State private var password = ""
    @State private var showAlert = false
    @State private var isInputEmpty = true
    @State private var passwordIsEmpty = true
    @State private var emailIsEmpty = true
    @State private var loginIsEmpty = true

    var body: some View {
        NavigationView {
            ScrollView() {
            VStack(spacing: 30) {
                    Image(systemName: "person")
                        .resizable()
                        .frame(width: 120,height: 120)
                        .clipShape(Circle())
                Text(UserDefaults.standard.string(forKey: "login") ?? "Login is not found")
                        .font(.title)
                        .bold()
                    HStack {
                        Image(systemName: "envelope")
                        Text(UserDefaults.standard.string(forKey: "email") ?? "Email is not found")
                    }
                Spacer()
                HStack {
                    Toggle(isOn: $isDarkTheme) {
                        Text("Dark theme")
                    }
                }.frame(width: 350)
                VStack(alignment: .leading, spacing: 5) {
                    Text("Login")
                        .font(.headline)
                        .foregroundColor(Color.blue)
                    TextField("Login", text: $login)
                        .padding()
                        .cornerRadius(10)
                        .border(Color.blue, width: 1)

                }.frame(width: 350)
                VStack(alignment: .leading, spacing: 5) {
                    Text("Email")
                        .font(.headline)
                        .foregroundColor(Color.blue)
                    TextField("Email", text: $email)
                        .padding()
                        .cornerRadius(10)
                        .border(Color.blue, width: 1)

                }.frame(width: 350)
                VStack(alignment: .leading, spacing: 5) {
                    Text("Password")
                        .font(.headline)
                        .foregroundColor(Color.blue)
                    SecureTextField(text: $password)
                        .padding()
                        .cornerRadius(10)
                        .border(Color.blue, width: 1)

                }.frame(width: 350)
                Spacer()
                    Button {
                        if (!login.isEmpty) {
                            UserDefaults.standard.setValue(login, forKey: "login")
                            isInputEmpty = false
                            loginIsEmpty = false
                        }
                        else {
                            loginIsEmpty = true
                        }
                        
                        if (!email.isEmpty) {
                            UserDefaults.standard.setValue(email, forKey: "email")
                            isInputEmpty = false
                            emailIsEmpty = false
                        }
                        else {
                            emailIsEmpty = true
                        }
                        
                        if (!password.isEmpty) {
                            UserDefaults.standard.setValue(password, forKey: "password")
                            isInputEmpty = false
                            passwordIsEmpty = false
                        }
                        else {
                            passwordIsEmpty = true
                        }
                        
                        
                        showAlert = true
                        email = ""
                        login = ""
                        password = ""
                        
                    } label: {
                        Text("Update Profile")
                            .bold()
                            .frame(width:260, height:50)
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                    }
                    .alert(isPresented: $showAlert) {
                                if (!isInputEmpty) {
                                    return Alert(title: Text("Success"), message: Text("Changed \(loginIsEmpty ? "" : "login ")\(emailIsEmpty ? "" : "email ")\(passwordIsEmpty ? "" : "password")"), dismissButton: .default(Text("OK")))
                                } else {
                                    return Alert(title: Text("Failure"), message: Text("Your input was empty"), dismissButton: .default(Text("OK")))
                                }
                            }
                }
            }
            //.padding()
            
        }
        .environment(\.colorScheme, isDarkTheme ? .dark : .light)
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
