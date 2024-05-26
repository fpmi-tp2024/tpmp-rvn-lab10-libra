//
//  ShopItemsParser.swift
//  Foodie
//
//  Created by Vasily on 25.05.24.
//

import Foundation
import UIKit
import SwiftUI

class ShopItemsParser {
    static public func getShopItems() -> [[Any]] {
        var shopItems: [[Any]] = []

        if let path = Bundle.main.path(forResource: "AppInnerData", ofType: "plist"),
           let data = try? Data(contentsOf: URL(fileURLWithPath: path)) {
            do {
                let plistData = try PropertyListSerialization.propertyList(from: data, options: [], format: nil)
                if let dict = plistData as? [String: Any],
                   let shopItemsDict = dict["Shop Items"] as? [String: [String: Any]] {
                    for (_, item) in shopItemsDict {
                        var oneItemArr: [Any] = []

                        if let image = item["Image"] as? String {
                            oneItemArr.append(image)
                        }

                        if let title = item["Title"] as? String {
                            oneItemArr.append(title)
                        }

                        if let price = item["Price"] as? Double {
                            oneItemArr.append(price)
                        }

                        if let colorDict = item["Color"] as? [String: Int] {
                            let red = CGFloat(colorDict["red"] ?? 0) / 255
                            let green = CGFloat(colorDict["green"] ?? 0) / 255
                            let blue = CGFloat(colorDict["blue"] ?? 0) / 255
                            let color = Color(UIColor(red: red, green: green, blue: blue, alpha: 1.0))
                            oneItemArr.append(color)
                        }

                        shopItems.append(oneItemArr)
                    }
                }
            } catch {
                print("Error reading Plist: \(error)")
            }
        }

        return shopItems
    }
}
