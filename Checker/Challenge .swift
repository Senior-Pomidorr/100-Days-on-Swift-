//
//  Challenge .swift
//  Checker
//
//  Created by Daniil Kulikovskiy on 18.07.2023.
//

import SwiftUI

struct Challenge: View {
    
    enum unitSymbol: String {
        case celsius = "° C"
        case farenheit = "° F"
        case kelvin = "° K"
    }
    
    private var celsius: Double
    private var farenheit: Double
    private var kelvin: Double
    
    var body: some View {
        Form {
            Section {
                TextField("Enter Value", value: $celsius, format: )
            }
            
        }
        .navigationTitle("Challenge")
    }
}

struct Challenge__Previews: PreviewProvider {
    static var previews: some View {
            Challenge()
    }
}
