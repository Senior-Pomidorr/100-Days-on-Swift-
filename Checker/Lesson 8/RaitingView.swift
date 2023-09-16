//
//  RaitingView.swift
//  Checker
//
//  Created by Daniil Kulikovskiy on 15.09.2023.
//

import SwiftUI

struct RaitingView: View {
    @Binding var raiting: Int
    var label = ""
    var maximumRating = 5
    var offImage: Image?
    var onImage = Image(systemName: "star.fill")
    var offColor = Color.gray
    var onColor = Color.yellow
    
    var body: some View {
        HStack {
            if label.isEmpty == false {
                Text(label)
            }
            
            ForEach(1..<maximumRating + 1, id: \.self) { number in
                image(for: number)
                    .foregroundColor(number > raiting ? offColor: onColor)
                    .onTapGesture {
                        raiting = number
                    }
            }
        }
    }
    
    func image(for number: Int) -> Image {
        if number > raiting {
            return offImage ?? onImage
        } else {
            return onImage
        }
    }
}

#Preview {
    RaitingView(raiting: .constant(4))
}
