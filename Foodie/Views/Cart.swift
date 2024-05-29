//
//  Cart.swift
//  Foodie
//
//  Created by Алина on 24.05.24.
//


import SwiftUI

struct Cart: View {    
    @AppStorage("isDarkTheme") var isDarkTheme: Bool = false
    @State private var showPaymentScreen = false
    @Binding var cartItems: [[Any]]
    @ObservedObject var cartViewModel = CartViewModel()
    
    var body: some View {
        VStack {
            Text("lMyCart")
                .font(.system(size: 44, weight: .semibold, design: .rounded))
                .frame(width: 320, alignment: .leading)
            List {
                ForEach(0..<cartItems.endIndex, id:\.self) {item in
                    HStack {
                        Image(cartItems[item][0] as! String)
                            .resizable()
                            .frame(width: 40, height: 40)
                        VStack(spacing: 5) {
                            Text(cartItems[item][1] as! String)
                            Text("$\(String(format: "%.2f", cartItems[item][2] as! Double))")
                                .foregroundColor(.gray)
                        }
                    }
                }
                .onDelete{indexSet in
                    cartItems.remove(atOffsets: indexSet)
                    cartViewModel.calculateTotalPriceForCart(cartItems: cartItems)
                }
            }
            Spacer()
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(.green)
                    .opacity(0.8)
                    .frame(width: 350, height: 120)
                VStack {
                    Text("LTotalPrice")
                        .foregroundColor(.white)
                        .font(.system(size: 20))
                        .frame(width: 350, alignment: .leading)
                        .padding(.leading, 60)
                    Text("$\(String(format: "%.2f", cartViewModel.totalPrice))")
                        .foregroundColor(.white)
                        .font(.system(size: 26, weight: .bold))
                        .frame(width: 350, alignment: .leading)
                        .padding(.leading, 60)
                }
                Button() {
                    self.showPaymentScreen = true
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .strokeBorder()
                            .frame(width: 120, height: 50)
                            .foregroundColor(.white)
                        Text("bPayNow")
                            .foregroundColor(.white)
                            .bold()
                            .accessibility(identifier: "PayButton")
                    }
                }
                .offset(x: 80)
                .disabled(cartViewModel.totalPrice == 0.00)
                .fullScreenCover(isPresented: $showPaymentScreen) {
                    Payment(cartItems: $cartItems, totalPrice: $cartViewModel.totalPrice)
                }
            }
            .onAppear {
                cartViewModel.calculateTotalPriceForCart(cartItems: cartItems)
            }
        }
        .environment(\.colorScheme, isDarkTheme ? .dark : .light)
    }
}

struct Cart_Previews: PreviewProvider {
    static var previews: some View {
        Cart(cartItems: .constant([]))
    }
}
