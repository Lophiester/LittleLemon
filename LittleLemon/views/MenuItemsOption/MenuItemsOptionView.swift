//
//  MenuOptionView.swift
//  LittleLemon
//
//  Created by Charles Yamamoto on 2024/03/23.
//

import SwiftUI

struct MenuItemsOptionView: View {
    
    @EnvironmentObject var viewModel: MenuItemsViewModel
    
  
    
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
    MenuItemsOptionView().environmentObject(MenuItemsViewModel())
}
