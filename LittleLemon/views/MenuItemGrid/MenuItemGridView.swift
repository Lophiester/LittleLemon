//
//  MenuItemGridView.swift
//  LittleLemon
//
//  Created by Charles Yamamoto on 2024/03/23.
//

import SwiftUI

struct MenuItemGridView: View {
    
    var viewModel =  MenuItemViewModel()
    var menuItems : [MenuItem]
    var menuCategory: MenuCategory
    
    
    let threeColumns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    
    
    var body: some View {
        VStack (alignment: .leading){
            HStack{
                Text(menuCategory.rawValue)
                    .font(.title2)
            }
            

            LazyVGrid(columns: threeColumns, content: {
                ForEach(menuItems) { items in
                    NavigationLink {
                        MenuItemDetailsView(menuItem: items)
                    } label: {
                        VStack{
                            RoundedRectangle(cornerSize: CGSize(width: 5, height: 5))
                            Text(items.title)
                                .fontWeight(.light)
                        }
                        .frame(width: 120 , height: 120)
                        .foregroundStyle(.black)
                    }

                
                    
                }
                
                
            })
        }
        .padding()
    }
}


struct MenuItemView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = MenuItemViewModel()
        MenuItemGridView(menuItems: viewModel.foods, menuCategory: .food)
    }
}
