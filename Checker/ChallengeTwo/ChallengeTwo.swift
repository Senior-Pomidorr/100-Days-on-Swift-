//
//  ChallengeTwo.swift
//  Checker
//
//  Created by Daniil Kulikovskiy on 23.07.2023.
//

import SwiftUI

struct LoadImage: View {
    var image: String
    var body: some View {
        Image(image)
            .resizable()
            .scaledToFit()
            .frame(width: 80, height: 80)
            .padding(18)
    }
}


struct ChallengeTwo: View {
    
    enum UnitChoice {
        case rock
        case paper
        case scissors
        
    }
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.5, blue: 0.99), location: 0.3),
                .init(color: Color(red: 0.99, green: 0.30, blue: 0.00), location: 0.4)
            ], center: .top, startRadius: 400, endRadius: 500)
                .ignoresSafeArea()
            VStack(spacing: 40) {
                Text("Choice the item")
                    .font(.largeTitle.bold())
                    .font(.subheadline.weight(.heavy))
                    .foregroundColor(.white)
                HStack {
                    LoadImage(image: "Rock")
                    LoadImage(image: "Paper")
                    LoadImage(image: "Scissors")
                }
                .background(.thinMaterial)
            }
        }
    }
}

struct ChallengeTwo_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeTwo()
    }
}
