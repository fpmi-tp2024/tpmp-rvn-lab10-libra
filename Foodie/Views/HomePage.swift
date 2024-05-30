//
//  ContentView.swift
//  Foodie
//
//  Created by Алина on 24.05.24.
//

import SwiftUI
import CoreData

// MARK: - Home Page View

struct HomePage: View {
    @AppStorage("isDarkTheme") var isDarkTheme: Bool = false
    @State private var showLoginScreen = false
    @State private var showRegisterScreen = false
    @State var isLogged = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                Image("avocado")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                Text("lStart1")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .multilineTextAlignment(.center)
                Text("lStart2")
                    .multilineTextAlignment(.center)
                    .foregroundColor(.gray)
                Button(action: {
                    self.showLoginScreen = true
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 50)
                            .foregroundColor(.green)
                        Text("bLogin")
                            .foregroundColor(.white)
                            .bold()
                    }
                    
                }
                .frame(width: 200, height: 35)
                .fullScreenCover(isPresented: $showLoginScreen) {
                    Login(isLogged: $isLogged)
                }
                Button(action: {
                    self.showRegisterScreen = true
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 50)
                            .foregroundColor(.green)
                        Text("bRegister")
                            .foregroundColor(.white)
                            .bold()
                    }
                    
                }
                .frame(width: 200, height: 35)
                .fullScreenCover(isPresented: $showRegisterScreen) {
                    Registration(isLogged: $isLogged)
                    
                }
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
        .fullScreenCover(isPresented: $isLogged) {
            Pages()
        }
        .environment(\.colorScheme, isDarkTheme ? .dark : .light)
    }
}

// MARK: - Home Page Preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
