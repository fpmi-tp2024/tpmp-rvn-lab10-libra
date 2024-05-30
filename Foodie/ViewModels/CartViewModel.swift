//
//  CartViewModel.swift
//  Foodie
//
//  Created by Vasily on 29.05.24.
//

import SwiftUI

class CartViewModel: ObservableObject {
    // MARK: - Cart View Observable items
    
    @Published var totalPrice = 0.00
    
    // MARK: - Methods required for Cart View
    
    func calculateTotalPriceForCart(cartItems: [[Any]]) {
        totalPrice = 0.00
        for i in 0..<cartItems.count {
            totalPrice += cartItems[i][2] as! Double
        }
    }
}
