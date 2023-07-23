//
//  GuessTheFlag.swift
//  Checker
//
//  Created by Daniil Kulikovskiy on 20.07.2023.
//

import SwiftUI

private struct LoadImage: View {
    var images: String
    var body: some View {
        Image(images)
            .renderingMode(.original)
            .clipShape(Capsule())
            .shadow(radius: 5)
    }
}

struct BlueText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.blue)
    }
}

struct GuessTheFlag: View {
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var countQuestions = 0
    @State private var countres = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 400)
            .ignoresSafeArea()
            
            VStack {
                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                VStack(spacing: 20) {
                    VStack {
                        Text("Tap the flag on")
                            .foregroundColor(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(countres[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                            .bold()
                            .makeBlue()
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                            progressGame(countQuestions: countQuestions)
                        } label: {
                            LoadImage(images: countres[number])
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.thinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score \(score)")
                    .foregroundColor(.white)
                    .font(.largeTitle.bold())
                Spacer()
                Spacer()
            }
            .padding(20)
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            if countQuestions == 8 {
                Button("Repeat the game", action: repeatTheGame)
            } else {
                Button("Continue", action: askQuestion)
            }
        } message: {
            Text("Your score is \(score)")
        }
    }
    private func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct "
            score += 1
        } else {
            scoreTitle = "False, this flag is - \(countres[number]) "
        }
        showingScore = true
        countQuestions += 1
        print(countQuestions)
    }
    
    private func askQuestion() {
        countres.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    private func progressGame(countQuestions: Int) {
        if countQuestions == 8 {
            scoreTitle = "The game is over"
        }
    }
    private func repeatTheGame() {
        countQuestions = 0
        score = 0
        countres.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

extension View {
    func makeBlue() -> some View {
        modifier(BlueText())
    }
}

struct GuessTheFlag_Previews: PreviewProvider {
    static var previews: some View {
        GuessTheFlag()
    }
}
