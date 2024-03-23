//
//  MenuOptionViewModel.swift
//  LittleLemon
//
//  Created by Charles Yamamoto on 2024/03/23.
//

import Foundation
import Observation

@Observable
class MenuItemOptionViewModel{
    
    var isOpenedOptionView = false
    var isShowFood = true
    var isShowDrinks = true
    var isShowDesserts = true
    
    var viewModel = MenuItemViewModel()
    
    var sortBy = SortBy.fromAtoZ
    
    
    func updateMenuItems() {
        switch sortBy {
        case .mostPopular:
            viewModel.foods.sort() { $0.ordersCount > $1.ordersCount }
            viewModel.drinks.sort() { $0.ordersCount > $1.ordersCount }
            viewModel.desserts.sort() { $0.ordersCount > $1.ordersCount }
        case .fromLowPrice:
            viewModel.foods.sort() { $0.price < $1.price }
            viewModel.drinks.sort() { $0.price < $1.price }
            viewModel.desserts.sort() { $0.price < $1.price }
        case .fromAtoZ:
            viewModel.foods.sort() {
                sortByTitle(firstMenuItem: $0, secondMenuItem: $1)
        
            }
            viewModel.drinks.sort() {
                sortByTitle(firstMenuItem: $0, secondMenuItem: $1)
            }
            viewModel.desserts.sort() {
                sortByTitle(firstMenuItem: $0, secondMenuItem: $1)
            }
        }
    }
 
    func sortByTitle(firstMenuItem: MenuItem, secondMenuItem: MenuItem) -> Bool {
        // Extract potential numeric suffixes from titles
        let (firstNumericSuffix, firstTitle) = extractTitleAndSuffix(from: firstMenuItem.title)
        let (secondNumericSuffix, secondTitle) = extractTitleAndSuffix(from: secondMenuItem.title)

        // Sort by numeric suffix first (if any)
        if let firstNumericSuffix = firstNumericSuffix, let secondNumericSuffix = secondNumericSuffix {
            return firstNumericSuffix < secondNumericSuffix
        } else if firstNumericSuffix != nil || secondNumericSuffix != nil {
            // If only one has a numeric suffix, the one with a suffix comes last
            return firstNumericSuffix == nil
        }

        // Fallback to standard lexicographic comparison
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
