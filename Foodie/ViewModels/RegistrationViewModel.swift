//
//  RegistrationViewModel.swift
//  Foodie
//
//  Created by Vasily on 29.05.24.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    // MARK: - Registration View Observable items
    
    @Published var email = "" {
        didSet {
            User.email = email
        }
    }
    @Published var login = "" {
        didSet {
            User.login = login
        }
    }
    @Published var password = "" {
        didSet {
            User.password = password
        }
    }
    @Published var confirmPassword = "" {
        didSet {
            User.confirmPassword = confirmPassword
        }
    }
    
    // MARK: - Methods required for Registration View
    
    func isRegistrationCorrect() -> Bool {
        if (!email.isEmpty && !login.isEmpty && !password.isEmpty && !confirmPassword.isEmpty && password == confirmPassword) {
            UserDefaults.standard.setValue(email, forKey: "email")
            UserDefaults.standard.setValue(login, forKey: "login")
            UserDefaults.standard.setValue(password, forKey: "password")
            
            return true
        }
        else {
            return false
        }
    }
}
