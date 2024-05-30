//
//  Settings.swift
//  Foodie
//
//  Created by Алина on 24.05.24.
//

import SwiftUI

struct Settings: View {
    
    @AppStorage("isDarkTheme") var isDarkTheme: Bool = false
    @State private var showAlert = false
    @ObservedObject var settingsViewModel = SettingsViewModel()

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
                        Text("LTheme")
                    }
                    .accessibility(identifier: "SwitchThemeToggle")
                }
                .frame(width: 350)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("lLogin")
                        .font(.headline)
                        .foregroundColor(Color.blue)
                    TextField("tLogin", text: $settingsViewModel.login)
                        .padding()
                        .cornerRadius(10)
                        .border(Color.blue, width: 1)
                        .accessibility(identifier: "UpdateLoginField")

                }
                .frame(width: 350)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("lEmail")
                        .font(.headline)
                        .foregroundColor(Color.blue)
                    TextField("lEmail", text: $settingsViewModel.email)
                        .padding()
                        .cornerRadius(10)
                        .border(Color.blue, width: 1)
                        .accessibility(identifier: "UpdateEmailField")

                }
                .frame(width: 350)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("tPassword")
                        .font(.headline)
                        .foregroundColor(Color.blue)
                    SecureTextField(text: $settingsViewModel.password)
                        .padding()
                        .cornerRadius(10)
                        .border(Color.blue, width: 1)
                        .accessibility(identifier: "UpdatePasswordField")

                }
                .frame(width: 350)
                
                Spacer()
                Button {
                    settingsViewModel.updateUserInfoButtonClick()
                    showAlert = true
                } label: {
                    Text("bUpdateProfile")
                        .bold()
                        .frame(width:260, height:50)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .accessibility(identifier: "UpdateButton")
                }
                .alert(isPresented: $showAlert) {
                    settingsViewModel.informUser()
                    }
                }
            }
        }
        .environment(\.colorScheme, isDarkTheme ? .dark : .light)
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
