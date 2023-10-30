//
//  ProjectSixteen.swift
//  Checker
//
//  Created by Daniil Kulikovskiy on 30.10.2023.
//

import SwiftUI

struct ProjectSixteen: View {
    let pictures = [
        "ales-krivec-15949",
        "galina-n-189483",
        "kevin-horstmann-141705",
        "nicolas-tissot-335096"
    ]
    
    let lebels = [
        "Tulips",
        "Frozen three buds",
        "Sunflowers",
        "Fireworks"
    ]
    
    @State private var selectedPictures = Int.random(in: 0...3)
    
    var body: some View {
        Image(pictures[selectedPictures])
            .resizable()
            .scaledToFit()
            .onTapGesture {
                selectedPictures = Int.random(in: 0...3)
            }
            .accessibilityLabel(lebels[selectedPictures])
            .accessibilityAddTraits(.isButton)
            .accessibilityRemoveTraits(.isImage)
    }
}

#Preview {
    ProjectSixteen()
}
