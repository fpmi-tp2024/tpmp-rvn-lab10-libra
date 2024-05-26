////  ContentView.swift
//  Foodie//
//  Created by Алина on 24.05.24.//
import SwiftUI
import CoreData
struct ContentView: View {
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
                Text("We deliver\n grocery at your\n doorstep")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .multilineTextAlignment(.center)
                Text("Grocerr gives you fresh vegetables and fruits,\nOrder fresh at grocerr")
                    .multilineTextAlignment(.center)
                    .foregroundColor(.gray)
                Button(action: {
                    self.showLoginScreen = true
                    
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 50)
                            .foregroundColor(.green)
                        Text("Login")
                            .foregroundColor(.white)
                            .bold()
                    }
                    
                }
                .frame(width: 200, height: 35)
                .fullScreenCover(isPresented: $showLoginScreen) {
                    //Login(isLogged: $isLogged)
                    Pages()
                }
                Button(action: {
                    self.showRegisterScreen = true
                    
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 50)
                            .foregroundColor(.green)
                        Text("Register")
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    
    }
}
