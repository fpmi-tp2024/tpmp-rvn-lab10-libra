//
//  ShopViewModel.swift
//  Foodie
//
//  Created by Vasily on 29.05.24.
//

import Foundation

class ShopViewModel: ObservableObject {
    @Published var filteredItems = shopItems
    @Published var searchText: String = "" {
        didSet {
            if (searchText.isEmpty) {
                filteredItems = shopItems
            } else {
                filteredItems = shopItems.filter { item in
                    let title = item[1] as! String
                    return title.localizedCaseInsensitiveContains(searchText)
                }
            }
        }
    }
}
