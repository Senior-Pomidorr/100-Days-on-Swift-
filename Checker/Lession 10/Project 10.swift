//
//  Project 10.swift
//  Checker
//
//  Created by Daniil Kulikovskiy on 20.09.2023.
//

import SwiftUI

struct ProjectTen: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [], predicate: NSPredicate(format: "name BEGINSWITH %@", "E")) var ships: FetchedResults<Ship>
    
    var body: some View {
        VStack {
            List(ships, id: \.self) { ship in
                Text(ship.name ?? "Unknow name")
            }
            
            Button("Add Examples") {
                let ship = Ship(context: moc)
                ship.name = "Enterprise"
                ship.universe = "Star Trek"
                
                let ship2 = Ship(context: moc)
                ship2.name = "Defiant"
                ship2.universe = "Star Wars"
                
                let ship3 = Ship(context: moc)
                ship3.name = "Milennium Falcon"
                ship3.universe = "Star Trek"
                
                let ship4 = Ship(context: moc)
                ship4.name = "Executor"
                ship4.universe = "Star Wars"
                
                try? moc.save()
                
            }
        }
    }
}

#Preview {
    ProjectTen()
}
