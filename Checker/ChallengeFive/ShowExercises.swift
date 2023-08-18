//
//  showExercises.swift
//  Checker
//
//  Created by Daniil Kulikovskiy on 19.08.2023.
//

import SwiftUI

struct ShowExercises: View {
    @ObservedObject var exercises: Exercises
    @Environment(\.dismiss) var dismiss
    @State private var name = ""
    @State private var amounth = ""
    @State private var workoutTime = ""
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name of exercises", text: $name)
                TextField("Amounth", text: $amounth)
                    .keyboardType(.decimalPad)
                TextField("Workout Time", text: $workoutTime)
                    .keyboardType(.numbersAndPunctuation)
            }
            .navigationTitle("Add new exercises")
            .toolbar {
                Button("Save") {
                    let item = ExercisesModel(name: name, amounth: Int(amounth) ?? 0, workoutTime: Double(workoutTime) ?? 0)
                    exercises.items.append(item)
                    dismiss()
                }
            }
        }
    }
}

struct showExercises_Previews: PreviewProvider {
    static var previews: some View {
        ShowExercises(exercises: Exercises())
    }
}
