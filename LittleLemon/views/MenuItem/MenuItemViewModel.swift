//
//  MenuItemViewModel.swift
//  LittleLemon
//
//  Created by Charles Yamamoto on 2024/03/20.
//

import Foundation
import Observation

@Observable
class MenuItemViewModel{
    
    var foods: [MenuItem] = [
        MenuItem(price: 20.0, title: "Food 1", menuCategory: .food, ordersCount: 150, ingredient: [.tomatoSauce, .carrot, .pasta, .broccoli, .spinach]),
        MenuItem(price: 30.0, title: "Food 2", menuCategory: .food, ordersCount: 200, ingredient: [.tomatoSauce, .broccoli, .spinach]),
        MenuItem(price: 22.0, title: "Food 3", menuCategory: .food, ordersCount: 150, ingredient: [.spinach]),
        MenuItem(price: 10.0, title: "Food 4", menuCategory: .food, ordersCount: 2000, ingredient: [.tomatoSauce, .carrot, .pasta]),
        MenuItem(price: 15.0, title: "Food 5", menuCategory: .food, ordersCount: 120, ingredient: [ .broccoli, .spinach, .carrot]),
        MenuItem(price: 16.0, title: "Food 6", menuCategory: .food, ordersCount: 320, ingredient: [.pasta, .spinach]),
        MenuItem(price: 19.0, title: "Food 7", menuCategory: .food, ordersCount: 78, ingredient: [.pasta, .spinach]),
        MenuItem(price: 30.0, title: "Food 8", menuCategory: .food, ordersCount: 620, ingredient: [.pasta, .spinach, .tomatoSauce]),
        MenuItem(price: 30.0, title: "Food 9", menuCategory: .food, ordersCount: 231, ingredient: [.pasta, .spinach, .tomatoSauce]),
        MenuItem(price: 30.0, title: "Food 10", menuCategory: .food, ordersCount: 435, ingredient: [.pasta, .spinach, .tomatoSauce]),
        MenuItem(price: 30.0, title: "Food 11", menuCategory: .food, ordersCount: 610, ingredient: [.pasta, .spinach, .tomatoSauce]),
        MenuItem(price: 30.0, title: "Food 12", menuCategory: .food, ordersCount: 620, ingredient: [.pasta, .spinach, .tomatoSauce]),
        
    ]
    
    var drinks: [MenuItem] = [
        MenuItem(price: 18.0, title: "Drink 1", menuCategory: .drink, ordersCount: 0, ingredient: []),
        MenuItem(price: 10.0, title: "Drink 2", menuCategory: .drink, ordersCount: 10, ingredient: []),
        MenuItem(price: 10.0, title: "Drink 3", menuCategory: .drink, ordersCount: 0, ingredient: []),
        MenuItem(price: 15.0, title: "Drink 4", menuCategory: .drink, ordersCount: 15, ingredient: []),
        MenuItem(price: 10.0, title: "Drink 5", menuCategory: .drink, ordersCount: 20, ingredient: []),
        MenuItem(price: 10.0, title: "Drink 6", menuCategory: .drink, ordersCount: 10, ingredient: []),
        MenuItem(price: 20.0, title: "Drink 7", menuCategory: .drink, ordersCount: 10, ingredient: []),
        MenuItem(price: 25.0, title: "Drink 8", menuCategory: .drink, ordersCount: 10, ingredient: [])
    ]
    
    var desserts: [MenuItem] = [
        MenuItem(price: 35.0, title: "Dessert 1", menuCategory: .dessert, ordersCount: 34, ingredient: []),
        MenuItem(price: 40.0, title: "Dessert 2", menuCategory: .dessert, ordersCount: 323, ingredient: []),
        MenuItem(price: 23.0, title: "Dessert 3", menuCategory: .dessert, ordersCount: 453, ingredient: []),
        MenuItem(price: 98.0, title: "Dessert 4", menuCategory: .dessert, ordersCount: 12310, ingredient: []),
    ]
    
    
    
}
