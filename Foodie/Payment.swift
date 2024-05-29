//
//  Payment.swift
//  Foodie
//
//  Created by Алина on 25.05.24.
//

import SwiftUI
import MapKit

struct Location: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

struct Payment: View {
    @AppStorage("isDarkTheme") var isDarkTheme: Bool = false
    @Environment(\.presentationMode) var presentationMode
    @State private var deliveryDate = Date()
    @State private var selectedIndex = 0
    @State private var comment = ""
    @State private var flip: Bool = false
    @State private var degrees: Double = 0
    @StateObject private var mapModel = MapModel()
    @Binding var cartItems: [[Any]]
    @Binding var totalPrice: Double
    
    private let locations = [Location(name: "Restaurant #1", coordinate: CLLocationCoordinate2D(latitude: 53.90222, longitude: 27.54829)), Location(name: "Restaurant #2", coordinate: CLLocationCoordinate2D(latitude: 53.89206, longitude: 27.55114)), Location(name: "Restaurant #3", coordinate: CLLocationCoordinate2D(latitude: 53.93004, longitude: 27.57754))]

    
    func getClosestLocations(userLocation: CLLocationCoordinate2D) -> [Location] {
        var distances: [CLLocationDistance] = []
        let user = CLLocation(latitude: userLocation.latitude, longitude: userLocation.longitude)
        
        for location in locations {
            let location2 = CLLocation(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
            distances.append(user.distance(from: location2))
        }

        var closestLocations: [Location] = []
        
        for location in locations {
            if (user.distance(from: CLLocation(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)) == distances.min()) {
                closestLocations.append(location)
            }
        }
        
        return closestLocations
    }
    
    var body: some View {
        NavigationView {
            ScrollView() {
                VStack {
                    Picker(selection: $selectedIndex, label :Text("")) {
                        Text("lCreditCard").tag(0)
                        Text("lCash").tag(1)
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
                Spacer()
                    .frame(height: 20)
                //Text("lDate")
                DatePicker("lDate", selection: $deliveryDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                Spacer()
                    .frame(height: 20)
                Map(coordinateRegion: $mapModel.region, showsUserLocation: true,  annotationItems: mapModel.userLocation.map({ getClosestLocations(userLocation: $0) }) ?? []) { location in
                    MapMarker(coordinate: location.coordinate)
                }
                    .onAppear{
                        mapModel.checkIfLocationServicesEnabled()
                    }
                    .accentColor(.red)
                    .frame(width:300, height:300)
                if #available(iOS 15.0, *) {
                    TextField("lAdress", text: $comment)
                        .padding()
                        .background(Color.mint)
                        .cornerRadius(10)
                } else {
                    // Fallback on earlier versions
                }
                Spacer()
                    .frame(height: 20)
                if #available(iOS 15.0, *) {
                    TextField("lComment", text: $comment)
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
                        Text("LTotalPrice")
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
                        cartItems = []
                        totalPrice = 0.0
                        self.presentationMode.wrappedValue.dismiss()
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .strokeBorder()
                                .frame(width: 120, height: 50)
                                .foregroundColor(.white)
                            Text("lConfirmPay")
                                .foregroundColor(.white)
                                .bold()
                        }
                    }.offset(x: 80)
                }
                
            }
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }) {
                            Image(systemName: "chevron.left")
                            Text("bBack")
                        }
                    }
                    
                }
           
        }
        .environment(\.colorScheme, isDarkTheme ? .dark : .light)
        
            
    }
        
        
}
            
    
        

struct Payment_Previews: PreviewProvider {
    static var previews: some View {
        Payment(cartItems: .constant([]), totalPrice: .constant(0.0))
    }
}
