//
//  Settings.swift
//  Foodie
//
//  Created by Алина on 24.05.24.
//

import SwiftUI

struct Settings: View {
    
    @AppStorage("isDarkTheme") var isDarkTheme: Bool = false
    @State private var email = ""
    @State private var login = ""
    @State private var password = ""
    var body: some View {
        NavigationView {
            ScrollView() {
            VStack(spacing: 30) {
                    Image(systemName: "person")
                        .resizable()
                        .frame(width: 120,height: 120)
                        .clipShape(Circle())
                    Text("Alina Ladik")
                        .font(.title)
                        .bold()
                    HStack {
                        Image(systemName: "envelope")
                        Text("myemeil@mail.com")
                    }
                Spacer()
                HStack {
                    Toggle(isOn: $isDarkTheme) {
                        Text("Dark theme")
                    }
                }.frame(width:350)
                VStack(alignment: .leading, spacing: 5) {
                    Text("Login")
                        .font(.headline)
                        .foregroundColor(Color.blue)
                    TextField("Login", text: $login)
                        .padding()
                        .cornerRadius(10)
                        .border(Color.blue, width: 1)
                    
                }.frame(width:350)
                VStack(alignment: .leading, spacing: 5) {
                    Text("Email")
                        .font(.headline)
                        .foregroundColor(Color.blue)
                    TextField("Email", text: $email)
                        .padding()
                        .cornerRadius(10)
                        .border(Color.blue, width: 1)
                    
                }.frame(width:350)
                VStack(alignment: .leading, spacing: 5) {
                    Text("Password")
                        .font(.headline)
                        .foregroundColor(Color.blue)
                    SecureTextField(text: $password)
                        .padding()
                        .cornerRadius(10)
                        .border(Color.blue, width: 1)
                    
                }
                .frame(width:350)
                Spacer()
                    Button {
                        
                    } label: {
                        Text("Update Profile")
                            .bold()
                            .frame(width:260, height:50)
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(12)
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
