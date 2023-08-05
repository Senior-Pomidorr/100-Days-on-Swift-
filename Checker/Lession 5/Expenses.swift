//
//  Expenses.swift
//  Checker
//
//  Created by Daniil Kulikovskiy on 05.08.2023.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]()
}
