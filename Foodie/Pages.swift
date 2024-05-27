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
                    Text("lMenu")
                }
            Cart()
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

struct Pages_Previews: PreviewProvider {
    static var previews: some View {
        Pages()
    }
}
