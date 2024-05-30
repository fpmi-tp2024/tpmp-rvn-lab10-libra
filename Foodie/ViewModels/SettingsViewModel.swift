//
//  SettingsViewModel.swift
//  Foodie
//
//  Created by Vasily on 29.05.24.
//

import SwiftUI

class SettingsViewModel: ObservableObject {
    // MARK: - Settings View Observable items
    
    @Published var email = ""
    @Published var login = ""
    @Published var password = ""
    @Published var isInputEmpty = true
    @Published var passwordIsEmpty = true {
        didSet {
            isInputEmpty = loginIsEmpty && passwordIsEmpty && emailIsEmpty
        }
    }
    @Published var emailIsEmpty = true {
        didSet {
            isInputEmpty = loginIsEmpty && passwordIsEmpty && emailIsEmpty
        }
    }
    @Published var loginIsEmpty = true {
        didSet {
            isInputEmpty = loginIsEmpty && passwordIsEmpty && emailIsEmpty
        }
    }
    
    // MARK: - Methods required for Settings View
    
    func updateUserInfoButtonClick() {
        emailIsEmpty = email.isEmpty
        loginIsEmpty = login.isEmpty
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

        login = ""
        email = ""
        password = ""
    }
    
    func informUser() -> Alert {
        if (!isInputEmpty) {
            return Alert(title: Text("tSuccess"), message: Text("Changed \(loginIsEmpty ? "" : "login ")\(emailIsEmpty ? "" : "email ")\(passwordIsEmpty ? "" : "password")"), dismissButton: .default(Text("tok")))
        } else {
            return Alert(title: Text("tFail"), message: Text("alertEmpty"), dismissButton: .default(Text("tok")))
        }
    }
}
