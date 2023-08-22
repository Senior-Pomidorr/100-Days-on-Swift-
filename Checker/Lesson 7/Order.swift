//
//  Order.swift
//  Checker
//
//  Created by Daniil Kulikovskiy on 21.08.2023.
//

import Foundation

final class Order: ObservableObject {
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
    
    @Published var name = ""
    @Published var streetAddress = ""
    @Published var city = ""
    @Published var zip = ""
    
    var hasValidAddress: Bool {
        if name.isEmpty || streetAddress.isEmpty || city.isEmpty || zip.isEmpty {
            return false
        }

        return true
    }
}
