//
//  MenuItemView.swift
//  LittleLemon
//
//  Created by Charles Yamamoto on 2024/03/20.
//

import SwiftUI

struct MenuItemView: View {
    
    @State var viewModel = MenuItemViewModel()
    @State var menuItemOptionViewModel = MenuItemOptionViewModel()
    
    var body: some View {
        NavigationStack{
            ScrollView{
                if menuItemOptionViewModel.isShowFood{
                    MenuItemGridView(menuItems: viewModel.foods, menuCategory: .food)
                }
                if menuItemOptionViewModel.isShowDrinks{
                    MenuItemGridView(menuItems: viewModel.drinks, menuCategory: .drink)
                }
                if menuItemOptionViewModel.isShowDesserts{
                    MenuItemGridView(menuItems: viewModel.desserts, menuCategory: .dessert)
                }
              
            }
            .onAppear() {
                menuItemOptionViewModel.updateMenuItems()
            }
            .navigationTitle("Menu")
            .toolbar{
                Button{
                    menuItemOptionViewModel.isOpenedOptionView.toggle()
                }label: {
                    Image(systemName: "line.3.horizontal.decrease.circle")
                }
            }
            .sheet(isPresented: $menuItemOptionViewModel.isOpenedOptionView) {
                NavigationStack {
                    MenuItemOptionView()
                        .toolbar {
                            // When the button is pressed, it sorts the data according to the user's choice
                            Button("Done") {
                                menuItemOptionViewModel.updateMenuItems()
                                menuItemOptionViewModel.isOpenedOptionView.toggle()
                            }
                        }
                }
            }
            
        }
        
    }
}


#Preview {
    MenuItemView()
}

