//
//  CheckerApp.swift
//  Checker
//
//  Created by Daniil Kulikovskiy on 16.07.2023.
//

import SwiftUI

@main
struct CheckerApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
  
