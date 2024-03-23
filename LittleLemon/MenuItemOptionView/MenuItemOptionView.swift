//
//  MenuOptionView.swift
//  LittleLemon
//
//  Created by Charles Yamamoto on 2024/03/23.
//

import SwiftUI

struct MenuItemOptionView: View {
    
    @State var viewModel = MenuItemOptionViewModel()
  
    
    var body: some View {
        NavigationStack{
            List{
                Section("Selected categories"){
                    Toggle(MenuCategory.food.rawValue, isOn: $viewModel.isShowFood)
                    Toggle(MenuCategory.drink.rawValue, isOn: $viewModel.isShowDrinks)
                    Toggle(MenuCategory.dessert.rawValue, isOn: $viewModel.isShowDesserts)
                    
                }
                Picker("Sort by", selection: $viewModel.sortBy) {
                    ForEach(SortBy.allCases, id: \.self) { category in
                        Text(category.rawValue).tag(category)
                    }
                }
            }
            .pickerStyle(.inline)
            .listStyle(.grouped)
        }
    }
}

#Preview {
    MenuItemOptionView()
}
