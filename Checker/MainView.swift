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
                Section("Day: 1 - 46") {
                    Group {
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
                        NavigationLink(destination: iExpense()) {
                            Text("Project 5: Day 36-38")
                        }
                        NavigationLink(destination: MoonShot()) {
                            Text("Project 6: Day 39-42")
                        }
                        NavigationLink(destination: Drawing()) {
                            Text("Challenge: Drawing")
                        }
                    }
                }
                
                Section("Day: 47 - ...") {
                    Group {
                        NavigationLink(destination: ActivityTracking()) {
                            Text("Challenge: Activity tracking")
                        }
                    }
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
