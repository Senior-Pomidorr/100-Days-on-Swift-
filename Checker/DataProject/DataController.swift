//
//  DataController.swift
//  Checker
//
//  Created by Daniil Kulikovskiy on 13.09.2023.
//

import CoreData
import Foundation

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "BoomWorm")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data fail to load \(error.localizedDescription)")
            }
            
            self.container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
        }
    }
}
