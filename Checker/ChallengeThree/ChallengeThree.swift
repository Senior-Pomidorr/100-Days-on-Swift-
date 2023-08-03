//
//  AnimationView.swift
//  Checker
//
//  Created by Daniil Kulikovskiy on 31.07.2023.
//

import SwiftUI

struct ChallengeThree: View {
    private var buttonOneValue = Int.random(in: 0...10)
    private var buttonTwoValue = Int.random(in: 0...10)
    private var correctAnswer = 0
    private var buttonOneTrueValue = Int.random(in: 0...10)
    private var buttonTwoFakeValue = Int.random(in: 0...10)
    private var score = 0
    
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
                        .font(.system(size: 70))
                        .background(.mint)
                        .clipShape(Circle())
                        .foregroundColor(.white)
                    
                    Label {
                        Text("\(buttonTwoValue)")
                            .frame(width: 80, height: 80)
                            .padding(30)
                    } icon: {}
                        .font(.system(size: 70))
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
                    Label {
                        Text("\(buttonOneTrueValue)")
                            .frame(width: 80, height: 80)
                            .padding(30)
                    } icon: {}
                        .font(.system(size: 70))
                        .background(.indigo)
                        .clipShape(Circle())
                        .foregroundColor(.white)
                    
                    Label {
                        Text("\(buttonTwoFakeValue)")
                            .frame(width: 80, height: 80)                            .padding(30)
                    } icon: {}
                        .font(.system(size: 70))
                        .background(.indigo)
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
                
                Text("Your score: \(score)")
                    .font(.system(size: 36))
                    .font(.headline)
                    .foregroundColor(Color(red: 0.76, green: 0.85, blue: 0.1))
                    .multilineTextAlignment(.center)
                    .padding([.leading, .trailing], 16)
                    .padding([.top], 10)
                
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AnimationView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeThree()
    }
}
