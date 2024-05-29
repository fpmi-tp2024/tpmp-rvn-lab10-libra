//
//  Login.swift
//  Foodie
//
//  Created by Алина on 24.05.24.
//

import SwiftUI

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
            Spacer()

            VStack(alignment: .leading, spacing: 5) {
                Text("tELogin")
                    .font(.headline)
                    .foregroundColor(Color.blue)
                TextField("tLogin", text: $loginViewModel.login)
                    .padding()
                    .cornerRadius(10)
                    .border(Color.blue, width: 1)
            }

            VStack(alignment: .leading, spacing: 5) {
                Text("tEPassword")
                    .font(.headline)
                    .foregroundColor(Color.blue)
                SecureTextField(text: $loginViewModel.password)
                    .padding()
                    .cornerRadius(10)
                    .border(Color.blue, width: 1)
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
