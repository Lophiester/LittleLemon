//
//  MenuItemViewModel.swift
//  LittleLemon
//
//  Created by Charles Yamamoto on 2024/03/20.
//

import Foundation

class MenuItemsViewModel: ObservableObject{
    
    @Published var foods: [MenuItem] = [
        MenuItem(price: 20.0, title: "Food 1", menuCategory: .food, ordersCount: 150, ingredient: [.tomatoSauce, .carrot, .pasta, .broccoli, .spinach]),
        MenuItem(price: 30.0, title: "Food 2", menuCategory: .food, ordersCount: 200, ingredient: [.tomatoSauce, .broccoli, .spinach]),
        MenuItem(price: 22.0, title: "Food 3", menuCategory: .food, ordersCount: 150, ingredient: [.spinach]),
        MenuItem(price: 10.0, title: "Food 4", menuCategory: .food, ordersCount: 2000, ingredient: [.tomatoSauce, .carrot, .pasta]),
        MenuItem(price: 15.0, title: "Food 5", menuCategory: .food, ordersCount: 120, ingredient: [ .broccoli, .spinach, .carrot]),
        MenuItem(price: 16.0, title: "Food 6", menuCategory: .food, ordersCount: 0, ingredient: [.pasta, .spinach]),
        MenuItem(price: 19.0, title: "Food 7", menuCategory: .food, ordersCount: 78, ingredient: [.pasta, .spinach]),
        MenuItem(price: 30.0, title: "Food 8", menuCategory: .food, ordersCount: 620, ingredient: [.pasta, .spinach, .tomatoSauce]),
        MenuItem(price: 30.0, title: "Food 9", menuCategory: .food, ordersCount: 231, ingredient: [.pasta, .spinach, .tomatoSauce]),
        MenuItem(price: 30.0, title: "Food 10", menuCategory: .food, ordersCount: 435, ingredient: [.pasta, .spinach, .tomatoSauce]),
        MenuItem(price: 30.0, title: "Food 11", menuCategory: .food, ordersCount: 610, ingredient: [.pasta, .spinach, .tomatoSauce]),
        MenuItem(price: 30.0, title: "Food 12", menuCategory: .food, ordersCount: 620, ingredient: [.pasta, .spinach, .tomatoSauce]),
        
    ]
    
    @Published  var drinks: [MenuItem] = [
        MenuItem(price: 18.0, title: "Drink 1", menuCategory: .drink, ordersCount: 0, ingredient: []),
        MenuItem(price: 10.0, title: "Drink 2", menuCategory: .drink, ordersCount: 10, ingredient: []),
        MenuItem(price: 10.0, title: "Drink 3", menuCategory: .drink, ordersCount: 0, ingredient: []),
        MenuItem(price: 15.0, title: "Drink 4", menuCategory: .drink, ordersCount: 15, ingredient: []),
        MenuItem(price: 10.0, title: "Drink 5", menuCategory: .drink, ordersCount: 20, ingredient: []),
        MenuItem(price: 10.0, title: "Drink 6", menuCategory: .drink, ordersCount: 10, ingredient: []),
        MenuItem(price: 20.0, title: "Drink 7", menuCategory: .drink, ordersCount: 10, ingredient: []),
        MenuItem(price: 25.0, title: "Drink 8", menuCategory: .drink, ordersCount: 10, ingredient: [])
    ]
    
    @Published   var desserts: [MenuItem] = [
        MenuItem(price: 35.0, title: "Dessert 1", menuCategory: .dessert, ordersCount: 34, ingredient: []),
        MenuItem(price: 40.0, title: "Dessert 2", menuCategory: .dessert, ordersCount: 323, ingredient: []),
        MenuItem(price: 23.0, title: "Dessert 3", menuCategory: .dessert, ordersCount: 453, ingredient: []),
        MenuItem(price: 98.0, title: "Dessert 4", menuCategory: .dessert, ordersCount: 12310, ingredient: []),
    ]
    
    
    
    @Published   var isOpenedOptionView = false
    @Published  var isShowFood = true
    @Published  var isShowDrinks = true
    @Published   var isShowDesserts = true
    @Published    var sortBy = SortBy.fromAtoZ
    
    
    func updateMenuItems() {
        switch sortBy {
        case .mostPopular:
         foods.sort() { $0.ordersCount > $1.ordersCount }
          drinks.sort() { $0.ordersCount > $1.ordersCount }
           desserts.sort() { $0.ordersCount > $1.ordersCount }
        case .fromLowPrice:
       foods.sort() { $0.price < $1.price }
           drinks.sort() { $0.price < $1.price }
            desserts.sort() { $0.price < $1.price }
        case .fromAtoZ:
            foods.sort() {
                sortByTitle(firstTitle: $0, secondTitle: $1)
        
            }
        drinks.sort() {
                sortByTitle(firstTitle: $0, secondTitle: $1)
            }
         desserts.sort() {
                sortByTitle(firstTitle: $0, secondTitle: $1)
            }
        }
    }
 
    func sortByTitle(firstTitle: MenuItem, secondTitle: MenuItem) -> Bool {

        // Extract numeric suffixes (if any) for comparison
        let (firstSuffix, firstTitle) = extractTitleAndSuffix(from: firstTitle.title)
        let (secondSuffix, secondTitle) = extractTitleAndSuffix(from: secondTitle.title)

        // Prioritize sorting by numeric suffixes:

        if let firstSuffix = firstSuffix, let secondSuffix = secondSuffix {
            // If both have suffixes, compare numerically
            return firstSuffix < secondSuffix
        } else if firstSuffix != nil || secondSuffix != nil {
            // If only one has a suffix, place the one without a suffix first
            return firstSuffix == nil
        }

        // If no suffixes are present, fallback to standard lexicographic comparison:
        return firstTitle < secondTitle
    }

    func extractTitleAndSuffix(from title: String) -> (Int?, String) {
        let components = title.components(separatedBy: .whitespacesAndNewlines)
        guard let lastComponent = components.last else { return (nil, title) }
        if let numericSuffix = Int(lastComponent) {
            return (numericSuffix, components.dropLast().joined(separator: " "))
        } else {
            return (nil, title)
        }
    }

    
    
}
