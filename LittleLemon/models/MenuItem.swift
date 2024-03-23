//
//  MenuItem.swift
//  LittleLemon
//
//  Created by Charles Yamamoto on 2024/03/20.
//

import Foundation


struct MenuItem: Identifiable {
    var id = UUID().uuidString
    var price: Double
    var title: String
    var menuCategory: MenuCategory
    var ordersCount: Int
    var ingredient: [Ingredient]
}

