//
//  FoodieApp.swift
//  Foodie
//
//  Created by Алина on 24.05.24.
//

import SwiftUI

@main
struct FoodieApp: App {
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
