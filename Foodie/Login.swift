//
//  Login.swift
//  Foodie
//
//  Created by Алина on 24.05.24.
//

import SwiftUI

struct Login: View {
    @AppStorage("isDarkTheme") var isDarkTheme: Bool = false
    @State private var login = ""
    @State private var password = ""
    @State private var isPasswordInputSecure = true
    @State private var isInputValid = false
    @State private var showAlert = false
    @Binding var isLogged: Bool
    @Environment(\.presentationMode) var presentationMode
    
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
                Text("tEPassword")
                    .font(.headline)
                    .foregroundColor(Color.blue)
                SecureTextField(text: $password)
                    .padding()
                    .cornerRadius(10)
                    .border(Color.blue, width: 1)
                    .accessibility(identifier: "PasswordField")
            }
            
            VStack() {
                Spacer()
                Button(action: {
                    if (!login.isEmpty && !password.isEmpty &&
                        (UserDefaults.standard.value(forKey: "login") != nil) && (UserDefaults.standard.value(forKey: "password") != nil) &&
                        (UserDefaults.standard.value(forKey: "login") as! String == login) && (UserDefaults.standard.value(forKey: "password") as! String == password)) {

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
                        Text("lConfirm")
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
            Alert(title: Text("tErr"), message: Text("alert3"), dismissButton: .default(Text("tok")))
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

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login(isLogged: .constant(false))
    }
}
