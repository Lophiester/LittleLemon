//
//  LittleLemonTests.swift
//  LittleLemonTests
//
//  Created by Charles Yamamoto on 2024/03/24.
//

import XCTest

@testable import LittleLemon

final class LittleLemonTests: XCTestCase {

    let viewModel = MenuItemsViewModel()
    
    func test_foodTitleEqualsToFood1(){
        let foodTitle = viewModel.foods[5]
        XCTAssertEqual(foodTitle.title, "Food 6")
    }
    
    func test_oredersCountEqualsTo0(){
        
        let ingredients = viewModel.foods[5]
        XCTAssertEqual(ingredients.ordersCount, 0)
    }



}
