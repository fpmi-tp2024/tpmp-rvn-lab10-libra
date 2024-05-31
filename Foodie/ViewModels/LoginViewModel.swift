//
//  LoginViewModel.swift
//  Foodie
//
//  Created by Vasily on 29.05.24.
//

import Foundation

class LoginViewModel: ObservableObject {
    // MARK: - Login View Observable items

    @Published var login = ""
    @Published var password = ""
    
    // MARK: - Methods required for Login View

    func isLoginCorrect() -> Bool {
        return (!login.isEmpty && !password.isEmpty &&
            ((UserDefaults.standard.value(forKey: "login") as? String ?? "") == login) &&
            ((UserDefaults.standard.value(forKey: "password") as? String ?? "") == password))
    }
}
