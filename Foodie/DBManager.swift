//
//  DBManager.swift
//  Foodie
//
//  Created by Vasily on 26.05.24.
//

import Foundation
import SQLite3
import SwiftUI

class DBManager {
    static private func getDBPointer() -> OpaquePointer? {
        var databasePointer: OpaquePointer?
        
        let documentDatabasePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("FoodieDB.db").path
        if (FileManager.default.fileExists(atPath: documentDatabasePath)) {
            print("Database already exists")
        }
        else {
            guard let bundleDatabasePath = Bundle.main.resourceURL?.appendingPathComponent("FoodieDB.db").path else {
                print("Unwrapping error: Bundle database path doesnt exist")
                return nil
            }
            
            do {
                try FileManager.default.copyItem(atPath: bundleDatabasePath, toPath: documentDatabasePath)
                print("Database copied")
            }
            catch{
                print("Error: \(error.localizedDescription)")
                return nil
            }
        }

        if (sqlite3_open(documentDatabasePath, &databasePointer) == SQLITE_OK) {
            print("Successfully opened database")
            print("Database path: \(documentDatabasePath)")
        }
        else {
            print("Couldnt open database")
        }
        
        return databasePointer
    }
    
    static func getItems() -> [[Any]] {
        var shopItems: [[Any]] = []
        let db = getDBPointer()
        let queryString = "SELECT Title, Image, Price, Color FROM MenuItems;"

        var queryStatement: OpaquePointer?

        if (sqlite3_prepare_v2(db, queryString, -1, &queryStatement, nil) == SQLITE_OK) {
            while (sqlite3_step(queryStatement) == SQLITE_ROW) {
                var oneItemArr: [Any] = []
                let title = String(cString: sqlite3_column_text(queryStatement, 0))
                let image = String(cString: sqlite3_column_text(queryStatement, 1))
                let price = sqlite3_column_double(queryStatement, 2)
                let colorString = String(cString: sqlite3_column_text(queryStatement, 3))

                let components = colorString.split(separator: ",")
                let red = CGFloat(Double(components[0]) ?? 0.0) / 255.0
                let green = CGFloat(Double(components[1]) ?? 0.0) / 255.0
                let blue = CGFloat(Double(components[2]) ?? 0.0) / 255.0
                let color = Color(UIColor(red: red, green: green, blue: blue, alpha: 1.0))
                
                oneItemArr.append(image)
                oneItemArr.append(title)
                oneItemArr.append(price)
                oneItemArr.append(color)
                
                shopItems.append(oneItemArr)
            }
        }
        else {
            let errorMessage = String(cString: sqlite3_errmsg(db))
            print("Error preparing query: \(errorMessage)")
        }


        sqlite3_finalize(queryStatement)

        sqlite3_close(db)
        
        return shopItems
    }
}
