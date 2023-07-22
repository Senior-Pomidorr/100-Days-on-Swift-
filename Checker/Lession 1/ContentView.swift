//
//  ContentView.swift
//  Checker
//
//  Created by Daniil Kulikovskiy on 16.07.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmounth = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPerchentage = 20
    @FocusState private var amounthIsFocus: Bool
    
    let tipPecentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPerchentage)
        let tipValue = checkAmounth / 100 * tipSelection
        let grandTotal = checkAmounth + tipValue
        let amountPerPerson = grandTotal / peopleCount
        return amountPerPerson
    }
    
    var totalAmounthTheCheck: Double {
        let total = checkAmounth + totalPerPerson
        return total
    }
    
    var body: some View {
            Form {
                Section {
                    TextField("Amounth", value: $checkAmounth, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amounthIsFocus)
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                }
                
                Section {
                    Picker("Tip percentage", selection: $tipPerchentage){
                        ForEach(0..<101) {
                            Text($0, format: .percent)
                        }
                        .pickerStyle(.navigationLink)
                    }
                } header: {
                    Text("How much tip do you pay to leave?")
                }
                
                Section {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                } header: {
                    Text("Amount per person")
                }
                
                Section {
                    Text(totalAmounthTheCheck, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .foregroundColor(checkAmounth == 0 ? .red : .black)
                } header: {
                    Text("Total amount for the check")
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        amounthIsFocus = false
                    }
                }
            }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
