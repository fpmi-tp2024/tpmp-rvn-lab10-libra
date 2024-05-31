//
//  Shop.swift
//  Foodie
//
//  Created by Алина on 24.05.24.
//

import SwiftUI

// MARK: - Shop Page View

struct Shop: View {
    @AppStorage("isDarkTheme") var isDarkTheme: Bool = false
    @Environment(\.presentationMode) var presentationMode
    @State var goToCart = false
    @State private var confirmExit = false
    @Binding var cartItems: [[Any]]
    @ObservedObject var shopViewModel = ShopViewModel()
    
    var columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
        
    var body: some View {
        NavigationView {
            // MARK: - Shop View inner contents
            
            VStack(spacing: 5) {
                SearchView(searchText: $shopViewModel.searchText)
                    .padding(.horizontal)
                Spacer()
                ScrollView() {
                    LazyVGrid(columns: columns, spacing: 30) {
                        ForEach(0..<shopViewModel.filteredItems.count, id:\.self) { item in
                            ShopItem(cartItems: $cartItems, imageName: shopViewModel.filteredItems[item][0] as! String, title: shopViewModel.filteredItems[item][1] as! String, price: shopViewModel.filteredItems[item][2] as! Double, color: shopViewModel.filteredItems[item][3] as! Color, selfIndex: item)
                        }
                    }
                }.padding(.bottom, 15)
            }
            .navigationViewStyle(.stack)
            .environment(\.colorScheme, isDarkTheme ? .dark : .light)
            // MARK: - Shop View toolbar
            
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        confirmExit = true
                    }) {
                        Image(systemName: "chevron.left")
                        Text("bBack")
                    }
                    .accessibility(identifier: "BackButton")
                }
            }
        }
        .navigationViewStyle(.stack)
        .accessibility(identifier: "ShopNavigationView")
        .environment(\.colorScheme, isDarkTheme ? .dark : .light)
        .alert(isPresented: $confirmExit) {
            Alert(title: Text("tConfExit"), message: Text("alert2"), primaryButton: .default(Text("tok")) {
                cartItems = []
                self.presentationMode.wrappedValue.dismiss()
            }, secondaryButton: .cancel() {
            })
        }
    }
}

// MARK: - Shop Page Preview

struct Shop_Previews: PreviewProvider {
    static var previews: some View {
        Shop(cartItems: .constant([]))
    }
}

