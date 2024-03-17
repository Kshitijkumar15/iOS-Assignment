//
//  Todo_AssignmentApp.swift
//  Todo Assignment
//
//  Created by kshitij on 16/03/24.
//

import SwiftUI

@main
struct Todo_AssignmentApp: App {
    
   @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
