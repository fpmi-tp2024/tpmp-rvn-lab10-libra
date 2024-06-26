//
//  CreditCard.swift
//  Foodie
//
//  Created by Алина on 25.05.24.
//

import SwiftUI

// MARK: - Credit Card Front View

struct CardFrontView: View {
    
    let creditCardInfo: CreditCardInfo
    
    var body: some View {
        if #available(iOS 15.0, *) {
            VStack {
                HStack {
                    Image(systemName: "checkmark.circle.fill")
                        .padding()
                    Spacer()
                    Text("VISA")
                        .font(.system(size: 18, weight: .bold, design: .monospaced))
                        .italic()
                        .padding()
                }
                
                Text(creditCardInfo.cardNumber.isEmpty ? " ": creditCardInfo.cardNumber)
                    .font(.system(size: 26, weight: .bold, design: .rounded))
                    .padding()
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("lCardNameB")
                            .opacity(0.5)
                            .font(.system(size: 14))
                        Text(creditCardInfo.cardHolderName.isEmpty ? " ": creditCardInfo.cardHolderName)
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .leading) {
                        Text("lCardDateB")
                            .opacity(0.5)
                            .font(.system(size: 14))
                        Text(creditCardInfo.expirationDate.isEmpty ? " ": creditCardInfo.expirationDate)
                    }
                    
                }.padding()
                
                Spacer()
            }
            .foregroundStyle(.white)
            .frame(width: 350, height: 250)
            .background {
                LinearGradient(colors: [.purple, .blue], startPoint: .topLeading, endPoint: .bottomTrailing)
            }
            .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
        } else {
            // Fallback on earlier versions
        }
    }
}

// MARK: - Credit Card Info

struct CreditCardInfo {
    var cardHolderName: String = ""
    var cardNumber: String = ""
    var expirationDate: String = ""
    var ccvCode: String = ""
}

// MARK: - Checkout Form View

@available(iOS 15.0, *)

struct CheckoutFormView: View {
    
    @Binding var creditCardInfo: CreditCardInfo
    let onCCVTapped: () -> Void
    @FocusState private var isCCVFocused: Bool
    
    var body: some View {
        Form {
            TextField("lCardName", text: $creditCardInfo.cardHolderName)
                .accessibility(identifier: "cardHolderNameTextField")
            TextField("lCardNum", text: $creditCardInfo.cardNumber)
                .accessibility(identifier: "cardNumberTextField")
            TextField("lCardDate", text: $creditCardInfo.expirationDate)
                .accessibility(identifier: "expirationDateTextField")
            if #available(iOS 15.0, *) {
                TextField("lCCV", text: $creditCardInfo.ccvCode)
                    .focused($isCCVFocused)
                    .onTapGesture {
                        isCCVFocused = true
                        onCCVTapped()
                    }
                    .accessibility(identifier: "ccvCodeTextField")
            } else {
                // Fallback on earlier versions
            }
        }
        
    }
}

// MARK: - Credit Card Back View

@available(iOS 15.0, *)
struct CardBackView: View {
    
    let creditCardInfo: CreditCardInfo
    
    @available(iOS 15.0, *)
    var body: some View {
        if #available(iOS 15.0, *) {
            VStack {
                Rectangle()
                    .fill(.black)
                    .frame(maxWidth: .infinity, maxHeight: 22)
                    .padding([.top], 20)
                
                Spacer()
                
                HStack {
                    
                    Text(" \(creditCardInfo.ccvCode)")
                        .frame(width: 100, height: 33, alignment: .leading)
                        .background(.white)
                        .foregroundStyle(.black)
                        .rotation3DEffect(
                            .degrees(180),
                            axis: (x: 0.0, y: 1.0, z: 0.0)
                        ).padding([.leading, .trailing, .bottom], 20)
                    
                    
                    Spacer()
                }
                
                
            }
            .foregroundStyle(.white)
            .frame(width: 350, height: 250)
            .background {
                LinearGradient(colors: [.purple, .blue], startPoint: .topLeading, endPoint: .bottomTrailing)
            }
            .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
        } else {
            // Fallback on earlier versions
        }
    }
}

// MARK: - Credit Card View

@available(iOS 15.0, *)
struct CreditCard: View {
   
    @State private var creditCardInfo = CreditCardInfo()
    @State private var flip: Bool = false
    @State private var degrees: Double = 0
    
    func clearCard() {
        creditCardInfo.cardNumber = ""
        creditCardInfo.cardHolderName = ""
        creditCardInfo.ccvCode = ""
        creditCardInfo.expirationDate = ""
    }
    
    var body: some View {
        VStack {
            
            VStack {
                if !flip {
                    CardFrontView(creditCardInfo: creditCardInfo)
                    
                } else {
                    if #available(iOS 15.0, *) {
                        CardBackView(creditCardInfo: creditCardInfo)
                    } else {
                        // Fallback on earlier versions
                    }
                }
            }.rotation3DEffect(
                .degrees(degrees),
                axis: (x: 0.0, y: 1.0, z: 0.0)
            )
            Spacer()
            if #available(iOS 15.0, *) {
                CheckoutFormView(creditCardInfo: $creditCardInfo, onCCVTapped: {
                    withAnimation {
                        degrees += 180
                        flip.toggle()
                    }
                })
            } else {
                // Fallback on earlier versions
            }
        } .frame(height:600)
    }
}

// MARK: - Credit Card Preview

struct CreditCard_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            if #available(iOS 15.0, *) {
                CreditCard()
            } else {
                // Fallback on earlier versions
            }
        }
    }
}

