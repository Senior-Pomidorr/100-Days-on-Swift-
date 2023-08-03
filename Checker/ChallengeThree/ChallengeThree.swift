//
//  AnimationView.swift
//  Checker
//
//  Created by Daniil Kulikovskiy on 31.07.2023.
//

import SwiftUI

struct ChallengeThree: View {
    private var buttonOneValue = Int.random(in: 0...100)
    private var buttonTwoValue = Int.random(in: 0...100)
    var body: some View {
        ZStack {
            Color.orange
                .edgesIgnoringSafeArea(.all)
            VStack {
                HStack(spacing: 30) {
                    Label {
                        Text("\(buttonOneValue)")
                            .frame(width: 100, height: 100)
                            .padding(30)
                    } icon: {}
                        .font(.system(size: 70))
                        .background(.mint)
                        .clipShape(Circle())
                        .foregroundColor(.white)
                    
                    Label {
                        Text("\(buttonTwoValue)")
                            .frame(width:  100, height: 100)
                            .padding(30)
                    } icon: {}
                        .font(.system(size: 70))
                        .background(.mint)
                        .clipShape(Circle())
                        .foregroundColor(.white)
                        .frame(width: 150, height: 150)
                }
                .padding(.vertical, 16)
                .padding(.horizontal, 16)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.thinMaterial)
                )
            }
        }
    }
}



struct AnimationView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeThree()
    }
}
