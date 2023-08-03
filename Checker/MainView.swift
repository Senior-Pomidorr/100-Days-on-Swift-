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
                    Text("Project 1: Day 16-18")
                }
                NavigationLink(destination: Challenge()) {
                    Text("Challenge")
                }
                NavigationLink(destination: GuessTheFlag()) {
                    Text("Project 2: Day 20-22")
                }
                NavigationLink(destination: ChallengeTwo()) {
                    Text("Challenge: The flags game")
                }
                NavigationLink(destination: StepperView()) {
                    Text("Project 3: Day 26-28")
                }
                NavigationLink(destination: WordScramble()) {
                    Text("Project 4: Day 29-31")
                }
                NavigationLink(destination: ChallengeThree()) {
                    Text("Challenge: Multiplication table")
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
