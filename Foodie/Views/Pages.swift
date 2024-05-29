//
//  Pages.swift
//  Foodie
//
//  Created by Алина on 24.05.24.
//

import SwiftUI

struct Pages: View {
    @AppStorage("isDarkTheme") var isDarkTheme: Bool = false
    @State private var cartItems: [[Any]] = []
    
    var body: some View {
        TabView {
            Shop(cartItems: $cartItems)
                .tabItem() {
                    Image(systemName: "cart")
                    Text("lMenu")
                        .accessibility(identifier: "MenuButton")
                }
            Cart(cartItems: $cartItems)
                .tabItem() {
                    Image(systemName: "bag")
                    Text("lCart")
                        .accessibility(identifier: "CartButton")
                }
            Settings()
                .tabItem() {
                    Image(systemName: "person")
                    Text("lSettings")
                        .accessibility(identifier: "SettingsButton")
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
