//
//  AddView.swift
//  Checker
//
//  Created by Daniil Kulikovskiy on 05.08.2023.
//

import SwiftUI

struct AddView: View {
    @ObservedObject var expeses: Expenses
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amounth = 0.0
    let types = ["Buisness", "Personal"]
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                
                TextField("Amounth", value: $amounth, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add new expense")
            .toolbar {
                Button("Save") {
                    let item = ExpenseItem(name: name, type: type, amounth: amounth)
                    expeses.items.append(item)
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expeses: Expenses())
    }
}
