//
//  MoonShot.swift
//  Checker
//
//  Created by Daniil Kulikovskiy on 06.08.2023.
//

import SwiftUI

struct MoonShot: View {
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(missions) { mission in
                        NavigationLink {
                            MissionView(mission: mission, astronauts: astronauts)
                        } label: {
                            VStack {
                                Image(mission.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .padding()
                
                                VStack {
                                    Text(mission.displayName)
                                        .font(.headline).foregroundColor(.white)
                                    Text(mission.formattedLaunchDate)
                                        .font(.caption)
                                        .foregroundColor(.white.opacity(0.5))
                                }
                                .padding(.vertical)
                                .frame(maxWidth: .infinity)
                                .background(.lightBackground)
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.lightBackground)
                                )
                        }
                    }
                    .background(.darkBackground)
                }
                .padding([.horizontal, .bottom])
            }
        }
        .navigationTitle("Moonshot")
        .background(.darkBackground)
        .preferredColorScheme(.dark)
    }
}

struct MoonShot_Previews: PreviewProvider {
    static var previews: some View {
        MoonShot()
    }
}
