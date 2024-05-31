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
            TextField(NSLocalizedString("tSearch", comment: ""), text :$searchText)
                .frame(height:50)
                .accessibility(identifier: "SearchField")
            Button(action: {
                searchText = ""
            }) {
                Image(systemName: "xmark.circle.fill")
                    .opacity(searchText == "" ? 0: 1)
            }
        }
        .padding(.horizontal, 10)
        .border(.blue)
    }
}
