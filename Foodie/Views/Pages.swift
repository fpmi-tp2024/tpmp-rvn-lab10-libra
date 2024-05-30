//
//  Pages.swift
//  Foodie
//
//  Created by Алина on 24.05.24.
//

import SwiftUI

// MARK: - Pages View

struct Pages: View {
    @AppStorage("isDarkTheme") var isDarkTheme: Bool = false
    @State private var cartItems: [[Any]] = []
    
    var body: some View {
        TabView {
            Shop(cartItems: $cartItems)
                .tabItem() {
                    Image(systemName: "cart")
                    Text("lMenu")
                }
            Cart(cartItems: $cartItems)
                .tabItem() {
                    Image(systemName: "bag")
                    Text("lCart")
                }
            Settings()
                .tabItem() {
                    Image(systemName: "person")
                    Text("lSettings")
                }
        }
        .environment(\.colorScheme, isDarkTheme ? .dark : .light)
    }
}

// MARK: - Pages Preview

struct Pages_Previews: PreviewProvider {
    static var previews: some View {
        Pages()
    }
}
