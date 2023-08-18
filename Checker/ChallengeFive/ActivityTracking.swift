//
//  Activitytracking.swift
//  Checker
//
//  Created by Daniil Kulikovskiy on 18.08.2023.
//

import SwiftUI

struct ActivityTracking: View {
    @StateObject var exercises = Exercises()
    @State private var showAddExercises = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(exercises.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.system(size: 24))
                                
                            Text(String(item.amounth))
                                .font(.system(size: 22))
                                
                                
                        }
                        
                        Spacer()
                        
                        Text(String(item.workoutTime))
                            .font(.system(size: 24))
                    }
                    .frame(height: 70)
                }
            }
            .toolbar {
                Button {
                    showAddExercises = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showAddExercises) {
                ShowExercises(exercises: exercises)
            }
        }
    }
}


struct ActivityTracking_Previews: PreviewProvider {
    static var previews: some View {
        ActivityTracking()
    }
}
