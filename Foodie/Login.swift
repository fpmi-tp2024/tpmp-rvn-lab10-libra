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
                Text("Enter login")
                    .font(.headline)
                    .foregroundColor(Color.blue)
                TextField("tLogin", text: $login)
                    .padding()
                    .cornerRadius(10)
                    .border(Color.blue, width: 1)
            }

            VStack(alignment: .leading, spacing: 5) {
                Text("Enter password")
                    .font(.headline)
                    .foregroundColor(Color.blue)
                SecureTextField(text: $password)
                    .padding()
                    .cornerRadius(10)
                    .border(Color.blue, width: 1)
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
                    }
                }
                .frame(width: 200, height: 40)
            }
        }
        .padding()
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Error"), message: Text("There is a mistake in your input. \nCheck if all fields are filled and if your input is correct"), dismissButton: .default(Text("OK")))
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
