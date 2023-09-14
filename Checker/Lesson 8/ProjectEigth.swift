//
//  Project 8.swift
//  Checker
//
//  Created by Daniil Kulikovskiy on 13.09.2023.
//

import SwiftUI

struct ProjectEigth: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var books: FetchedResults<Book>
    
    @State private var showingAddScreen = false
    
    var body: some View {
        NavigationStack {
            Text("Count: \(books.count)")
                .navigationTitle("BookWarm")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            showingAddScreen.toggle()
                        } label: {
                            Label("Add Book", systemImage: "plus")
                        }
                    }
                }
                .sheet(isPresented: $showingAddScreen, content: {
                    AddBookView()
                })
        }
    }
}

struct ProjectEigth_Previews: PreviewProvider {
    static var previews: some View {
        ProjectEigth()
    }
}

