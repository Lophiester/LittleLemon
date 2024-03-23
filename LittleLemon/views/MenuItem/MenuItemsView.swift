//
//  MenuItemView.swift
//  LittleLemon
//
//  Created by Charles Yamamoto on 2024/03/20.
//

import SwiftUI

struct MenuItemsView: View {
    
   @StateObject private var viewModel = MenuItemsViewModel()

    
    var body: some View {
        NavigationStack{
            ScrollView{
                if viewModel.isShowFood{
                    MenuItemGridView(menuItems: viewModel.foods, menuCategory: .food)
                }
                if viewModel.isShowDrinks{
                    MenuItemGridView(menuItems: viewModel.drinks, menuCategory: .drink)
                }
                if viewModel.isShowDesserts{
                    MenuItemGridView(menuItems: viewModel.desserts, menuCategory: .dessert)
                }
              
            }
            .onAppear() {
                viewModel.updateMenuItems()
            }
            .navigationTitle("Menu")
            .toolbar{
                Button(action: {viewModel.isOpenedOptionView.toggle()}, label: {
                    Image(systemName: "line.3.horizontal.decrease.circle")
                })
            }
            .sheet(isPresented: $viewModel.isOpenedOptionView) {
                NavigationStack {
                    MenuItemsOptionView().environmentObject(viewModel)
                        .toolbar {
                            Button("Done") {
                                viewModel.updateMenuItems()
                                viewModel.isOpenedOptionView.toggle()
                            }
                        }
                }
            }
            
        }
        
    }
}


#Preview {
    MenuItemsView()
}
