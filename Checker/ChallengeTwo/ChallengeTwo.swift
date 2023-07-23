//
//  ChallengeTwo.swift
//  Checker
//
//  Created by Daniil Kulikovskiy on 23.07.2023.
//

import SwiftUI

private struct LoadImage: View {
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
    
    enum UnitChoice: String {
        case rock = "Rock"
        case paper = "Paper"
        case scissors = "Scissors"
    }
    
    @State private var pictures = ["Rock", "Paper", "Scissors"].shuffled()
    @State private var random = Int.random(in: 0...2)
    private var yourScore = 0
    private var computerScore = 0
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.5, blue: 0.99), location: 0.3),
                .init(color: Color(red: 0.99, green: 0.30, blue: 0.00), location: 0.4)
            ], center: .top, startRadius: 400, endRadius: 500)
                .ignoresSafeArea()
            VStack(spacing: 15) {
                Text("You win")
                    .font(.largeTitle.bold())
                    .font(.subheadline.weight(.heavy))
                    .foregroundColor(.white)
                Text("Choice the item")
                    .font(.largeTitle.bold())
                    .font(.subheadline.weight(.heavy))
                    .foregroundColor(.white)
                HStack {
                    ForEach(0..<3) { number in
                        Button {
                            
                        } label: {
                            LoadImage(image: pictures[number])
                        }
                        .background(.thinMaterial)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                    }
                }
                .padding(10)
                Text("Сomputer choice")
                    .font(.largeTitle.bold())
                    .font(.subheadline.weight(.heavy))
                    .foregroundColor(.white)
                LoadImage(image: pictures[random])
                    .background(.thinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                HStack {
                    Button {
            
                    } label: {
                        Text("Yes")
                            .frame(width: 100, height: 50)
                            .font(.largeTitle.bold())
                            .font(.subheadline.weight(.heavy))
                            .foregroundColor(.white)
                            .background(.green)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .padding(5)
                            .shadow(radius: 5)
                    }
                    Button {
                        
                    } label: {
                        Text("No")
                            .frame(width: 100, height: 50)
                            .font(.largeTitle.bold())
                            .font(.subheadline.weight(.heavy))
                            .foregroundColor(.white)
                            .background(.teal)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .padding(5)
                            .shadow(radius: 5)
//                            .overlay(
//                                        RoundedRectangle(cornerRadius: 20)
//                                            .stroke(Color.white, lineWidth: 2) // Adjust the color and line width of the outline as needed
//                                    )
                    }
                }
    
                VStack {
                    Text("Your Score: ")
                        .font(.headline.bold())
                        .font(.subheadline.weight(.heavy))
                        .foregroundColor(.white)
                        .padding(10)
                    Text("Computer Score: ")
                        .font(.headline.bold())
                        .font(.subheadline.weight(.heavy))
                        .foregroundColor(.white)
                }
                .padding(10)
                Button {
                    
                } label: {
                    Text("Restart the game")
                        .frame(width: 300, height: 50)
                        .font(.largeTitle.bold())
                        .font(.subheadline.weight(.heavy))
                        .foregroundColor(.white)
                        .background(.mint)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .shadow(radius: 5)
                }
                Spacer()
                Spacer()
            }
        }
    }
}

struct ChallengeTwo_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeTwo()
    }
}
