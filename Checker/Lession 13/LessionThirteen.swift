//
//  LessionThirteen.swift
//  Checker
//
//  Created by Daniil Kulikovskiy on 22.09.2023.
//
import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI

struct LessionThirteen: View {
    @State private var image: Image?
    @State private var showingImagePicker = false
    
    
    var body: some View {
        VStack {
          image?
                .resizable()
                .scaledToFit()
            
            Button("Selected image") {
                showingImagePicker = true
            }
        }
        .sheet(isPresented: $showingImagePicker) {
            ImagePicker()
        }
    }
}

#Preview {
    LessionThirteen()
}
