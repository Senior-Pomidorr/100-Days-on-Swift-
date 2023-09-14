//
//  Project 8.swift
//  Checker
//
//  Created by Daniil Kulikovskiy on 13.09.2023.
//

import SwiftUI

struct ProjectEigth: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var students: FetchedResults<Student>
    
    var body: some View {
        VStack {
            List(students) { student in
                Text(student.name ?? "Unknow")
            }
            Button("Add") {
                let firstNames = ["Harry", "Ron", "Hermione", "Luna", "Ginny"]
                let lastName = ["Granger", "Potter", "Lovegood", "Weasley"]
                let chosenFirstnmae = firstNames.randomElement()!
                let chosenSecondName = lastName.randomElement()!
                
                let student = Student(context: moc)
                student.id = UUID()
                student.name = "\(chosenFirstnmae) \(chosenSecondName)"
                try? moc.save()
            }
        }
    }
}

struct ProjectEigth_Previews: PreviewProvider {
    static var previews: some View {
        ProjectEigth()
    }
}

