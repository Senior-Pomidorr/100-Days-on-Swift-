//
//  AnimationView.swift
//  Checker
//
//  Created by Daniil Kulikovskiy on 31.07.2023.
//

import SwiftUI

struct ChallengeThree: View {
    @State private var buttonOneValue = Int.random(in: 0...10)
    @State private var buttonTwoValue = Int.random(in: 0...10)
    @State private var correctAnswer = 0
    @State private var buttonOneTrueValue = 0
    @State private var buttonTwoFakeValue = Int.random(in: 0...10)
    @State private var score = 0
    @State private var answer = false
    
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.1, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.85, blue: 0.1), location: 0.3)
            ], center: .top, startRadius: 490, endRadius: 420)
            .ignoresSafeArea()
            VStack {
                Text("How much will it be if \(buttonOneValue) is multiplied by \(buttonTwoValue)?")
                    .font(.system(size: 36))
                    .font(.headline)
                    .foregroundColor(.blue)
                    .multilineTextAlignment(.center)
                    .padding([.leading, .trailing], 16)
                
                HStack(spacing: 30) {
                    Label {
                        Text("\(buttonOneValue)")
                            .frame(width: 80, height: 80)
                            .padding(30)
                    } icon: {}
                        .font(.system(size: 65))
                        .background(.mint)
                        .clipShape(Circle())
                        .foregroundColor(.white)
                    
                    Label {
                        Text("\(buttonTwoValue)")
                            .frame(width: 80, height: 80)
                            .padding(30)
                    } icon: {}
                        .font(.system(size: 65))
                        .background(.mint)
                        .clipShape(Circle())
                        .foregroundColor(.white)
                        .frame(width: 150, height: 150)
                }
                .padding(.vertical, 10)
                .padding(.horizontal, 20)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.thinMaterial)
                )
                .shadow(radius: 10)
                
                VStack {
                    Text("Choice correct answer")
                        .font(.system(size: 36))
                        .font(.headline)
                        .foregroundColor(Color(red: 0.76, green: 0.85, blue: 0.1))
                        .multilineTextAlignment(.center)
                        .padding([.leading, .trailing], 16)
                        .padding([.bottom], 20)
                        .padding(.top, 40)
                }
                
                HStack(spacing: 30) {
                    Button {
                        checkAnswer(buttonNumber: 1)
                    } label: {
                        Text("\(buttonOneTrueValue)")
                            .frame(width: 80, height: 80)
                            .padding(30)
                            .font(.system(size: 65))
                            .background(.indigo)
                            .clipShape(Circle())
                            .foregroundColor(.white)
                    }
                    
                    Button {
                        checkAnswer(buttonNumber: 2)
                    } label: {
                        Text("\(buttonTwoFakeValue)")
                            .frame(width: 80, height: 80)
                            .padding(30)
                            .font(.system(size: 65))
                            .background(.indigo)
                            .clipShape(Circle())
                            .foregroundColor(.white)
                            .frame(width: 150, height: 150)
                    }
                }
                .padding(.vertical, 10)
                .padding(.horizontal, 20)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.thinMaterial)
                )
                .shadow(radius: 10)
                
                Text("Your score: \(score)")
                    .font(.system(size: 36))
                    .font(.headline)
                    .foregroundColor(Color(red: 0.76, green: 0.85, blue: 0.1))
                    .multilineTextAlignment(.center)
                    .padding([.leading, .trailing], 16)
                    .padding([.top], 10)
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    private func checkAnswer(buttonNumber: Int) {
        buttonOneTrueValue = buttonOneValue * buttonTwoValue

        if buttonOneValue * buttonTwoValue == buttonOneTrueValue {
            score += 1
        } else {
            score -= 1
        }
        randomNumbers()
        swapButtonValues()
    }
    
    private func randomNumbers() {
        buttonOneValue = Int.random(in: 0...10)
        buttonTwoValue = Int.random(in: 0...10)
        
        let product = buttonOneValue * buttonTwoValue
        buttonTwoFakeValue = product + Int.random(in: -3...3)
        buttonOneTrueValue = product
    }
    
    private func swapButtonValues() {
        let randomNumber = Int.random(in: 0...1)
           if randomNumber == 0 {
               let tempValue = buttonOneTrueValue
               buttonOneTrueValue = buttonTwoFakeValue
               buttonTwoFakeValue = tempValue
           } else {
               let tempValue = buttonTwoFakeValue
               buttonTwoFakeValue = buttonOneTrueValue
               buttonOneTrueValue = tempValue
           }
      
    }
}

struct AnimationView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeThree()
    }
}
