//
//  iExpense.swift
//  Checker
//
//  Created by Daniil Kulikovskiy on 04.08.2023.
//

import SwiftUI

struct iExpense: View {
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(expenses.items) { item in
                    Text(item.name)
                }
                .onDelete(perform: removeItems)
            }
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expeses: expenses)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

struct iExpense_Previews: PreviewProvider {
    static var previews: some View {
        iExpense()
    }
}
