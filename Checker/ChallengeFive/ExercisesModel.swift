//
//  Exercises.swift
//  Checker
//
//  Created by Daniil Kulikovskiy on 18.08.2023.
//

import Foundation

struct ExercisesModel: Identifiable, Codable {
    var id = UUID()
    var name: String
    var amounth: Int
    var workoutTime: Double
}
