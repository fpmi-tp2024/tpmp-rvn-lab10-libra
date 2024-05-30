//
//  SearchView.swift
//  Foodie
//
//  Created by Vasily on 29.05.24.
//

import SwiftUI

// MARK: - Search View

struct SearchView : View {
    
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            TextField("tSearch", text :$searchText)
                .foregroundColor(.black)
                .frame(height:50)
            Button(action: {
                searchText = ""
            }) {
                Image(systemName: "xmark.circle.fill")
                    .foregroundColor(.gray)
                    .opacity(searchText == "" ? 0: 1)
            }
        }
        .padding(.horizontal, 10)
        .background(Color.white)
        .cornerRadius(10)
        
    }
}
