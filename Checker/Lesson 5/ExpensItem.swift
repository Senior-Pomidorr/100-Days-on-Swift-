//
//  ExpensItem.swift
//  Checker
//
//  Created by Daniil Kulikovskiy on 05.08.2023.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amounth: Double
}
