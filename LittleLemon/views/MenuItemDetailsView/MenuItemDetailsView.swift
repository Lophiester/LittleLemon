//
//  MenuItemDetailsView.swift
//  LittleLemon
//
//  Created by Charles Yamamoto on 2024/03/23.
//

import SwiftUI


struct MenuItemDetailsView: View {

    let menuItem: MenuItem

    init(menuItem: MenuItem) {
      self.menuItem = menuItem
    }

    var formattedPrice: String {
      return String(format: "%.2f", menuItem.price)
    }

    var orderedCountText: String {
      return "\(menuItem.ordersCount)"
    }
    
    var body: some View {
        NavigationStack {
          VStack(spacing: 20) {
            Image("Little Lemon logo")
              .resizable()
              .scaledToFit()
              .frame(width: 400, height: 400)

            VStack {
              Text("Price:")
                .fontWeight(.bold)
                Text(formattedPrice)
            }

            VStack {
              Text("Ordered:")
                .fontWeight(.bold)
              Text(orderedCountText)
            }

            VStack {
              Text("Ingredients:")
                .fontWeight(.bold)
                ForEach(menuItem.ingredient, id: \.self) { ingredient in
                    Text(ingredient.rawValue)
              }
            }
          }
          .padding()
    }
      
  }
}

#Preview {
  NavigationStack {
      let menuItem = MenuItem(price: 10.0,title: "Food", menuCategory: .food, ordersCount: 16, ingredient: [.broccoli,.carrot,.pasta,.spinach,.tomatoSauce])
      MenuItemDetailsView(menuItem: menuItem)
    
  }
}
