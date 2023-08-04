//
//  ChallengeTwo.swift
//  Checker
//
//  Created by Daniil Kulikovskiy on 23.07.2023.
//

import SwiftUI
import GameplayKit

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
    
    enum UnitChoice: Int {
        case rock = 0
        case paper = 1
        case scissors = 2
        
        enum Status: String {
            case Win
            case Lose
            case Draw
        }
        
        func getResult(choice: UnitChoice) -> String {
            switch (self, choice) {
            case (.rock, .rock), (.paper, .paper), (.scissors, .scissors):
                return Status.Draw.rawValue
            case (.rock, .scissors), (.paper, .rock), (.scissors, .paper):
                return Status.Win.rawValue
            default:
                return Status.Lose.rawValue
            }
        }
    }
    
    @State private var pictures = ["Rock", "Paper", "Scissors"]
    @State private var userRandom = Int.random(in: 0...2)
    @State private var infoView = ""
    @State private var shouldWin = false
    @State private var yourScore = 0
    @State private var scoreAlert = false
    @State private var countQuestions = 0
    @State private var compChoices = Int.random(in: 0..<3)
    
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.5, blue: 0.99), location: 0.3),
                .init(color: Color(red: 0.99, green: 0.30, blue: 0.00), location: 0.4)
            ], center: .top, startRadius: 400, endRadius: 500)
            .ignoresSafeArea()
            VStack(spacing: 12) {
                Text("\(infoView)")
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
                            play(choices: number)
                        } label: {
                            LoadImage(image: pictures[number])
                        }
                        .background(.thinMaterial)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                    }
                }
                .padding(30)
                Text("Сomputer choice")
                    .font(.largeTitle.bold())
                    .font(.subheadline.weight(.heavy))
                    .foregroundColor(.white)
                    .padding(30)
                LoadImage(image: pictures[compChoices])
                    .background(.thinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("Your Score: \(yourScore)")
                    .font(.headline.bold())
                    .foregroundColor(.white)
                    .font(.system(size: 60))
                    .padding(10)
                Button {
                    repeatTheGame()
                } label: {
                    Text("Restart")
                        .frame(width: 300, height: 60)
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
            .alert(infoView, isPresented: $scoreAlert) {
                if countQuestions == 8 {
                    Button("Repeat the game", action: repeatTheGame)
                } else {
                    Button("Continue", action: playGame)
                }
            } message: {
                Text("Your score is \(yourScore)")
            }
            .navigationBarTitleDisplayMode(.automatic)
        }
    }
    
    func playGame() {
        compChoices = Int.random(in: 0..<3)
        shouldWin.toggle()
        countQuestions += 1
    }
    
    
    func play(choices: Int) {
        let winningMoves = [1, 2, 0]
        let didWin: Bool
        
        if shouldWin {
            didWin = choices == winningMoves[compChoices]
        } else {
            didWin = winningMoves[choices] == compChoices
        }
        if didWin {
            yourScore += 1
            infoView = "You win"
        } else {
            yourScore -= 1
            infoView = "You lose"
        }
        
        scoreAlert = true
        playGame()
    }
    
    
    
    private func question() {
        pictures.shuffle()
        userRandom = Int.random(in: 0...2)
    }
    
    private func repeatTheGame() {
        pictures.shuffle()
        yourScore = 0
        countQuestions = 0
    }
    
    
}

struct ChallengeTwo_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeTwo()
    }
}
