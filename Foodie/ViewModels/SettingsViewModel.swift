//
//  SettingsViewModel.swift
//  Foodie
//
//  Created by Vasily on 29.05.24.
//

import SwiftUI

class SettingsViewModel: ObservableObject {
    @Published var email = ""
    @Published var login = ""
    @Published var password = ""
    @Published var isInputEmpty = true
    @Published var passwordIsEmpty = true {
        didSet {
            isInputEmpty = isInputEmpty && passwordIsEmpty
        }
    }
    @Published var emailIsEmpty = true {
        didSet {
            isInputEmpty = isInputEmpty && emailIsEmpty
        }
    }
    @Published var loginIsEmpty = true {
        didSet {
            isInputEmpty = isInputEmpty && loginIsEmpty
        }
    }
    
    func updateUserInfoButtonClick() {
        loginIsEmpty = login.isEmpty
        emailIsEmpty = email.isEmpty
        passwordIsEmpty = password.isEmpty

        if (!loginIsEmpty) {
            UserDefaults.standard.setValue(login, forKey: "login")
            User.login = login
        }

        if (!emailIsEmpty) {
            UserDefaults.standard.setValue(email, forKey: "email")
            User.email = email
        }
            
        if (!passwordIsEmpty) {
            UserDefaults.standard.setValue(password, forKey: "password")
            User.password = password
            User.confirmPassword = password
        }
    }
    
    func informUser() -> Alert {
        if (!isInputEmpty) {
            login = ""
            email = ""
            password = ""
            return Alert(title: Text("tSuccess"), message: Text("Changed \(loginIsEmpty ? "" : "login ")\(emailIsEmpty ? "" : "email ")\(passwordIsEmpty ? "" : "password")"), dismissButton: .default(Text("tok")))
        } else {
            return Alert(title: Text("tFail"), message: Text("alertEmpty"), dismissButton: .default(Text("tok")))
        }
    }
}
