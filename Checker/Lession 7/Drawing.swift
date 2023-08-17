//
//  Drawing.swift
//  Checker
//
//  Created by Daniil Kulikovskiy on 15.08.2023.
//

import SwiftUI



struct Drawing: View {
    @State private var lineWidth: CGFloat = 1.0
    @State private var shadow = 1.0
    
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 200, y: 100))
            path.addLine(to: CGPoint(x: 100, y: 300))
            path.addLine(to: CGPoint(x: 300, y: 300))
            path.addLine(to: CGPoint(x: 200, y: 100))
            path.move(to: CGPoint(x: 160, y: 300))
            path.addLine(to: CGPoint(x: 160, y: 600))
            path.addLine(to: CGPoint(x: 240, y: 600))
            path.addLine(to: CGPoint(x: 240, y: 300))
            path.closeSubpath()
        }
        .fill(.blue)
        .overlay(
            Path { path in
                path.move(to: CGPoint(x: 200, y: 100))
                path.addLine(to: CGPoint(x: 100, y: 300))
                path.addLine(to: CGPoint(x: 160, y: 300))
                path.addLine(to: CGPoint(x: 160, y: 300))
                path.addLine(to: CGPoint(x: 160, y: 600))
                path.addLine(to: CGPoint(x: 240, y: 600))
                path.addLine(to: CGPoint(x: 240, y: 300))
                path.addLine(to: CGPoint(x: 300, y: 300))
                path.addLine(to: CGPoint(x: 200, y: 100))
                path.closeSubpath()
            }
                .stroke(Color.pink, lineWidth: lineWidth)
                .shadow(radius: shadow)
        )
        .onTapGesture {
            withAnimation {
                lineWidth = (lineWidth == 1.0) ? 8.0 : 1.0
                    shadow = (shadow == 1.0) ? 10.0 : 1.0
            }
        }
    }
}



struct Drawing_Previews: PreviewProvider {
    static var previews: some View {
        Drawing()
    }
}
