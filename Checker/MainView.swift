//
//  MainView.swift
//  Checker
//
//  Created by Daniil Kulikovskiy on 18.07.2023.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationStack {
            Form {
                NavigationLink(destination: ContentView()) { 
                    Text("Lesson 1")
                }
                NavigationLink(destination: Challenge()) {
                    Text("Challenge")
                }
            }
            .navigationTitle("100 Days of Swift")
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
