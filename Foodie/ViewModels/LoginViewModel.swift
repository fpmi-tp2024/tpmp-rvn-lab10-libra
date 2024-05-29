//
//  LoginViewModel.swift
//  Foodie
//
//  Created by Vasily on 29.05.24.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var login = ""
    @Published var password = ""
    
    func isLoginCorrect() -> Bool {
        return (!login.isEmpty && !password.isEmpty &&
            ((UserDefaults.standard.value(forKey: "login") as? String ?? "") == login) &&
            ((UserDefaults.standard.value(forKey: "password") as? String ?? "") == password))
    }
}
