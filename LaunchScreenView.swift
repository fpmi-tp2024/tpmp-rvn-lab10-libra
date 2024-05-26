//
//  LaunchScreenView.swift
//  Foodie
//
//  Created by Алина on 25.05.24.
//

import SwiftUI

struct LaunchScreenView: View {
    var body: some View {
        ZStack {
            Color.green
            
            Image("foodie")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height:50)
                .position(x:UIScreen.main.bounds.width/2, y: UIScreen.main.bounds.height/2)
        }
        .ignoresSafeArea()
    }
}

struct LaunchScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreenView()
    }
}
