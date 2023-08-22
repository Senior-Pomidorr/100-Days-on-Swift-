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
            VStack {
                List {
                    VStack {
                        HStack {
                            Spacer()
                            Image("alf")
                                .resizable()
                                .scaledToFill()
                                .clipShape(Circle())
                                .frame(width: 120, height: 120, alignment: .center)
                                .overlay(Circle().stroke(.black, lineWidth: 3))
                                .shadow(radius: 2)
                            Spacer()
                        }
                        Text("Mr. Alf")
                            .font(.system(.title))
                        Button (action: {
                            showAddExercises = true
                        }, label: {
                            Text("Add activity")
                                .font(.headline)
                                .foregroundColor(.white)
                        })
                        .frame(width: 260, height: 55)
                        .background(.orange)
                        .clipShape(RoundedRectangle(cornerRadius: 24))
                        .shadow(radius: 2)
                        .contentShape(RoundedRectangle(cornerRadius: 24))
                    }
                    Section {
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
                        .onDelete(perform: removeItems)
                    }
                }
            }
            .sheet(isPresented: $showAddExercises) {
                ShowExercises(exercises: exercises)
            }
        }
    }
    private func removeItems(at offsets: IndexSet) {
        exercises.items.remove(atOffsets: offsets)
    }
}


struct ActivityTracking_Previews: PreviewProvider {
    static var previews: some View {
        ActivityTracking()
    }
}
