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
                    Text("Lesson 1: Day 16-18")
                }
                NavigationLink(destination: Challenge()) {
                    Text("Challenge")
                }
                NavigationLink(destination: GuessTheFlag()) {
                    Text("Lession 2: Day 20-24")
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
