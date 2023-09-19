//
//  Project 9.swift
//  Checker
//
//  Created by Daniil Kulikovskiy on 19.09.2023.
//

import SwiftUI

struct ProjectNine: View {
    @Environment(\.managedObjectContext) var mocWizard
    @FetchRequest(sortDescriptors: []) var wizrds: FetchedResults<Wizard>
    
    var body: some View {
        VStack {
            List(wizrds, id: \.self) {wizard in
                Text(wizard.name ?? "Unknown")
            }
            
            Button("Add") {
                let wizard = Wizard(context: mocWizard)
                wizard.name = "Harry Potter"
            }
            
            Button("Save") {
                do {
                    try mocWizard.save()
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}

#Preview {
    ProjectNine()
}
