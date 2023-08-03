//
//  AnimationView.swift
//  Checker
//
//  Created by Daniil Kulikovskiy on 31.07.2023.
//

import SwiftUI

struct CornerRotateModifier: ViewModifier {
    let amounth: Double
    let anchor: UnitPoint
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(amounth), anchor: anchor)
            .clipped()
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(active: CornerRotateModifier(amounth: -90, anchor: .topLeading), identity: CornerRotateModifier(amounth: 0, anchor: .topLeading))
    }
}


struct AnimationView: View {
    @State private var isShowingRed = false
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.blue)
                .frame(width: 200, height: 200)
                
                if isShowingRed {
                    Rectangle()
                        .fill(.red)
                        .frame(width: 200, height: 200)
                        .transition(.pivot)
                }
            }
            .onTapGesture {
                withAnimation{
                    isShowingRed.toggle()
                }
            }
        }
    }



struct AnimationView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationView()
    }
}
