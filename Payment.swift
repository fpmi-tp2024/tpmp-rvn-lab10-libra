//
//  Payment.swift
//  Foodie
//
//  Created by Алина on 25.05.24.
//

import SwiftUI
import MapKit

struct Payment: View {
    @AppStorage("isDarkTheme") var isDarkTheme: Bool = false
    @Environment(\.presentationMode) var presentationMode
    @State private var deliveryDate = Date()
    @State private var totalPrice = 0.00
    @State private var selectedIndex = 0
    @State private var comment = ""
    @State private var flip: Bool = false
    @State private var degrees: Double = 0
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.331, longitude: -121.89), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
    func calculateTotalPrice() {
        totalPrice = 0.00
        for i in 0..<cartItems.count {
            totalPrice += cartItems[i][2] as! Double
        }
    }
    var body: some View {
        NavigationView {
            
            ScrollView() {
                VStack {
                    Picker(selection: $selectedIndex, label :Text("")) {
                        Text("Credit Card").tag(0)
                        Text("Cash").tag(1)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                ZStack {
                    if selectedIndex == 0 {
                        if #available(iOS 15.0, *) {
                            CreditCard()
                        } else {
                            // Fallback on earlier versions
                        }
                    }
                }
                
                DatePicker("Delivery time", selection: $deliveryDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                Map(coordinateRegion: $region, showsUserLocation: true)
                    .onAppear{
                       // ContentViewModel.checkIfLocationServicesIsEnabled()
                    }
                    .frame(width:300, height:300)
                if #available(iOS 15.0, *) {
                    TextField("Comment", text: $comment)
                        .padding()
                        .background(Color.mint)
                        .cornerRadius(10)
                } else {
                    // Fallback on earlier versions
                }
                    
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(.green)
                        .opacity(0.8)
                        .frame(width: 350, height: 120)
                    VStack {
                        Text("Total Price")
                            .foregroundColor(.white)
                            .font(.system(size: 20))
                            .frame(width: 350, alignment: .leading)
                            .padding(.leading, 60)
                        Text("$\(String(format: "%.2f", totalPrice))")
                            .foregroundColor(.white)
                            .font(.system(size: 26, weight: .bold))
                            .frame(width: 350, alignment: .leading)
                            .padding(.leading, 60)
                    }
                    Button() {
                        
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .strokeBorder()
                                .frame(width: 120, height: 50)
                                .foregroundColor(.white)
                            Text("Confirm Pay")
                                .foregroundColor(.white)
                                .bold()
                        }
                    }.offset(x: 80)
                }
                
            }.onAppear(perform: self.calculateTotalPrice)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }) {
                            Image(systemName: "chevron.left")
                            Text("Back")
                        }
                    }
                    
                }
           
        }
        .environment(\.colorScheme, isDarkTheme ? .dark : .light)
        
            
    }
        
        
}
            
    
        

struct Payment_Previews: PreviewProvider {
    static var previews: some View {
        Payment()
    }
}


