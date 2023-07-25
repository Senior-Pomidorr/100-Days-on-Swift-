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
    @State private var userChoice: UnitChoice = .rock
    @State private var computerChoice: UnitChoice = .rock

    
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
                            choiceItem(item: number)
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
                LoadImage(image: pictures[userRandom])
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
                    Button("Continue", action: question)
                }
            } message: {
                Text("Your score is \(yourScore)")
            }
            .navigationBarTitleDisplayMode(.automatic)
        }
    }
    
    private func choiceItem(item: Int) {
            userChoice = randomSign(numberIn: item)
            computerChoice = UnitChoice(rawValue: Int.random(in: 0...2))!
            
            let result = userChoice.getResult(choice: computerChoice)
            switch result {
            case UnitChoice.Status.Win.rawValue:
                yourScore += 1
                infoView = "You Win!"
            case UnitChoice.Status.Lose.rawValue:
                yourScore -= 1
                infoView = "You Lose!"
            case UnitChoice.Status.Draw.rawValue:
                infoView = "It's a Draw!"
            default:
                break
            }
            scoreAlert = true
            print(pictures)
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
    
    func randomSign(numberIn: Int) -> UnitChoice {
        if numberIn == 0 {
            print("rock")
            return .rock
        } else if numberIn == 1 {
            print("paper")
            return .paper
        } else {
            print("scissors")
            return .scissors
        }
    }
}

struct ChallengeTwo_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeTwo()
    }
}
