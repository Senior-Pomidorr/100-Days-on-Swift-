//
//  Exercises.swift
//  Checker
//
//  Created by Daniil Kulikovskiy on 18.08.2023.
//

import Foundation

final class Exercises: ObservableObject {
    @Published var items = [ExercisesModel]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "ExerciseItems")
            }
        }
    }
    init() {
        if let saveItems = UserDefaults.standard.data(forKey: "ExerciseItems") {
            if let decodedItems = try? JSONDecoder().decode([ExercisesModel].self, from: saveItems) {
                items = decodedItems
                return
            }
        }
        items = []
    }
}
