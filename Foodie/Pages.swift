//
//  Pages.swift
//  Foodie
//
//  Created by Алина on 24.05.24.
//

import SwiftUI

struct Pages: View {
    @AppStorage("isDarkTheme") var isDarkTheme: Bool = false
    
    var body: some View {
        TabView {
            Shop()
                .tabItem() {
                    Image(systemName: "cart")
                    Text("Menu")
                }
            Cart()
                .tabItem() {
                    Image(systemName: "bag")
                    Text("Cart")
                }
            Settings()
                .tabItem() {
                    Image(systemName: "person")
                    Text("Settings")
                }
        }
        .environment(\.colorScheme, isDarkTheme ? .dark : .light)
    }
}

struct Pages_Previews: PreviewProvider {
    static var previews: some View {
        Pages()
    }
}
