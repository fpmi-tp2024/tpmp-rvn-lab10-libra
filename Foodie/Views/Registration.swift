//
//  Registration.swift
//  Foodie
//
//  Created by Алина on 24.05.24.
//

import SwiftUI

struct Registration: View {
    @AppStorage("isDarkTheme") var isDarkTheme: Bool = false
    @Environment(\.presentationMode) var presentationMode
    @State private var isPasswordInputSecure = true
    @State private var isConfirmPasswordInputSecure = true
    @State private var showAlert = false
    @State public var isVisible = true
    @Binding var isLogged: Bool
    @ObservedObject private var registrationViewModel = RegistrationViewModel()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Spacer()
                VStack(alignment: .leading, spacing: 5) {
                    Text("tELogin")
                        .font(.headline)
                        .foregroundColor(Color.blue)
                    TextField("tLogin", text: $registrationViewModel.login)
                        .padding()
                        .cornerRadius(10)
                        .border(Color.blue, width: 1)
                    
                }
                VStack(alignment: .leading, spacing: 5) {
                    Text("tEEmail")
                        .font(.headline)
                        .foregroundColor(Color.blue)
                    TextField("lEmail", text: $registrationViewModel.email)
                        .padding()
                        .cornerRadius(10)
                        .border(Color.blue, width: 1)
                    
                }
                VStack(alignment: .leading, spacing: 5) {
                    Text("tEPassword")
                        .font(.headline)
                        .foregroundColor(Color.blue)
                    SecureTextField(text: $registrationViewModel.password)
                        .padding()
                        .cornerRadius(10)
                        .border(Color.blue, width: 1)
                    
                }
                VStack(alignment: .leading, spacing: 5) {
                    Text("lConfirm")
                        .font(.headline)
                        .foregroundColor(Color.blue)
                    SecureTextField(text: $registrationViewModel.confirmPassword)
                        .padding()
                        .cornerRadius(10)
                        .border(Color.blue, width: 1)
                }
                VStack() {
                    Spacer()
                    Button(action: {
                        if (registrationViewModel.isRegistrationCorrect()) {
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
                            Text("bConfirm")
                                .foregroundColor(.white)
                                .bold()
                        }
                    }
                    .frame(width: 200, height: 40)
                }
            }
            .padding()
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
