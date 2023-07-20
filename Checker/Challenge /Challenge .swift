//
//  Challenge .swift
//  Checker
//
//  Created by Daniil Kulikovskiy on 18.07.2023.
//

import SwiftUI
import Foundation

struct Challenge: View {
    
    enum unitSymbol: String {
        case celsius = "° C"
        case farenheit = "° F"
        case kelvin = "° K"
    }
    @State private var defaultValue = 0.0
    @State private var selectedUnit: unitSymbol = .celsius
    @State private var convertedUnit: unitSymbol = .farenheit
    
    private var celsius = UnitTemperature.celsius
    private let fahrenheit = UnitTemperature.fahrenheit
    private let kelvin = UnitTemperature.kelvin
    
    private var convertedValue: Measurement<UnitTemperature> {
        let inputMensurment = Measurement(value: defaultValue, unit: selectedUnit.toUnit())
        return inputMensurment.converted(to: convertedUnit.toUnit())
    }
    
    var body: some View {
        Form {
            Section {
                TextField("Write your temperature", value: $defaultValue, format: .number)
                    .keyboardType(.decimalPad)
            } header: {
                Text("Enter your Temperature")
            }
            
            Section {
                Picker("Choice converted", selection: $selectedUnit) {
                    Text(unitSymbol.celsius.rawValue).tag(unitSymbol.celsius)
                    Text(unitSymbol.farenheit.rawValue).tag(unitSymbol.farenheit)
                    Text(unitSymbol.kelvin.rawValue).tag(unitSymbol.kelvin)
                }
                .pickerStyle(.segmented)
            } header: {
                Text("Choice convert unit")
            }
            
            Section {
                Picker("Choice converted", selection: $convertedUnit) {
                    Text(unitSymbol.celsius.rawValue).tag(unitSymbol.celsius)
                    Text(unitSymbol.farenheit.rawValue).tag(unitSymbol.farenheit)
                    Text(unitSymbol.kelvin.rawValue).tag(unitSymbol.kelvin)
                }
                .pickerStyle(.segmented)
            } header: {
                Text("Converted Unit:")
            }
            
            Section {
                Text("\(convertedValue.value, specifier: "%.2f") \(convertedUnit.rawValue)")
            } header: {
                Text("Temrature now")
            }
        }
        .navigationTitle("Challenge")
    }
}

extension Challenge.unitSymbol {
    func toUnit() -> UnitTemperature {
        switch self {
        case .celsius:
            return UnitTemperature.celsius
        case .farenheit:
            return UnitTemperature.fahrenheit
        case .kelvin:
            return UnitTemperature.kelvin
        }
    }
}

struct Challenge__Previews: PreviewProvider {
    static var previews: some View {
        Challenge()
    }
}

