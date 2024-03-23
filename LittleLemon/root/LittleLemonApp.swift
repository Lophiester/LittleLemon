//
//  LittleLemonApp.swift
//  LittleLemon
//
//  Created by Charles Yamamoto on 2024/03/20.
//

import SwiftUI

@main
struct LittleLemonApp: App {
    @StateObject var env = MenuItemsViewModel()
    
    var body: some Scene {
        
        WindowGroup {
         
            MenuItemsView().environmentObject(env)
            
        }
    }
}
