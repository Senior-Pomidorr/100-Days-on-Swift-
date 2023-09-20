//
//  Project 11.swift
//  Checker
//
//  Created by Daniil Kulikovskiy on 20.09.2023.
//

import SwiftUI

struct ProjectEleven: View {
    @Environment(\.managedObjectContext) var moc
    @State private var lastNameFilter = "A"
    
    
    var body: some View {
        VStack {
            FilteredList(filterKey: "last name", filterValue: lastNameFilter) { (singer: Singer) in
                Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
            }
            
            Button("Add Examples") {
                let tayler = Singer(context: moc)
                tayler.firstName = "Tayler"
                tayler.lastName = "Swift"
                
                let ed = Singer(context: moc)
                ed.firstName = "Ed"
                ed.lastName = "Sherman"
                
                let adele = Singer(context: moc)
                adele.firstName = "Adele"
                adele.lastName = "Adkins"
                
                try? moc.save()
            }
            
            Button("Show A") {
                lastNameFilter = "A"
            }
            Button("Show S") {
                lastNameFilter = "S"
            }
        }
    }
}

#Preview {
    ProjectEleven()
}
