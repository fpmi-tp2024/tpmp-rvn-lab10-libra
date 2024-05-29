//
//  CartViewModel.swift
//  Foodie
//
//  Created by Vasily on 29.05.24.
//

import SwiftUI

class CartViewModel: ObservableObject {
    
    @Published var totalPrice = 0.00
    
    func calculateTotalPriceForCart(cartItems: [[Any]]) {
        totalPrice = 0.00
        for i in 0..<cartItems.count {
            totalPrice += cartItems[i][2] as! Double
        }
    }
}
