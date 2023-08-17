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
    @State private var colorCycle = 0.0
    
    var amount = 0.0
    var steps = 100
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.2, green: 0.1, blue: 0.8), location: 0.3),
                .init(color: Color(red: 1.0, green: 0.3, blue: 1.0), location: 0.4)
            ], center: .top, startRadius: 450, endRadius: 420)
            .ignoresSafeArea()
            ForEach(0..<steps) { value in
                Circle()
                    .inset(by: Double(value))
                    .strokeBorder(color(for: value, brightness: 1), lineWidth: 2)
            }
            .padding(.bottom, 140)

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
            .offset(x: 5, y: 100)
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
                    .offset(x: 5, y: 100)
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
    
    func color(for value: Int, brightness: Double) -> Color {
           var targetHue = Double(value) / Double(steps) + amount

           if targetHue > 1 {
               targetHue -= 1
           }

           return Color(hue: targetHue, saturation: 1, brightness: brightness)
       }
}



struct Drawing_Previews: PreviewProvider {
    static var previews: some View {
        Drawing()
    }
}
