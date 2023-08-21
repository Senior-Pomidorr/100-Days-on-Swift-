//
//  Order.swift
//  Checker
//
//  Created by Daniil Kulikovskiy on 21.08.2023.
//

import Foundation

class Order: ObservableObject {
    static let types = ["Vanilla", "Starweberry", "Chocolate", "Rainbow"]
    
    @Published var type = 0
    @Published var quantity = 0
    
    @Published var extraFrosting = false
    @Published var addSprinkles = false
    @Published var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    
    
}
