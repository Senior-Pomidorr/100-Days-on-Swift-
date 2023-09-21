//
//  LessionTwelve.swift
//  Checker
//
//  Created by Daniil Kulikovskiy on 21.09.2023.
//

import SwiftUI

struct LessionTwelve: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var countries: FetchedResults<Country>
    
    
    var body: some View {
        VStack {
            List {
                ForEach(countries, id: \.self) { country in
                    Section(country.wrappedFullName) {
                        ForEach(country.candyArray, id: \.self) {candy in
                            Text(candy.wrappedName)
                        }
                    }
                    
                }
            }
            Button("Add Example") {
                let candy1 = Candy(context: moc)
                candy1.name = "Mars"
                candy1.origin = Country(context: moc)
                candy1.origin?.shortName = "UK"
                candy1.origin?.fullname = "United Kingdom"
                
                let candy2 = Candy(context: moc)
                candy2.name = "Twix"
                candy2.origin = Country(context: moc)
                candy2.origin?.shortName = "UK"
                candy2.origin?.fullname = "United Kingdom"
                
                let candy3 = Candy(context: moc)
                candy3.name = "Kit-Kat"
                candy3.origin = Country(context: moc)
                candy3.origin?.shortName = "UK"
                candy3.origin?.fullname = "United Kingdom"
                
                let candy4 = Candy(context: moc)
                candy4.name = "Toblerone"
                candy4.origin = Country(context: moc)
                candy4.origin?.shortName = "CN"
                candy4.origin?.fullname = "Switzerland"
                
                try? moc.save()
            }
        }
    }
}

#Preview {
    LessionTwelve()
}
