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
    @State private var inputImage: UIImage?
    
    
    var body: some View {
        VStack {
          image?
                .resizable()
                .scaledToFit()
            
            Button("Selected image") {
                showingImagePicker = true
            }
            
            Button("Save image") {
                guard let inputImage = inputImage else { return }
                let imageSaver = ImageSaver()
                imageSaver.writeToPhotoAlbun(image: inputImage)
            }
        }
        .sheet(isPresented: $showingImagePicker) {
            ImagePicker(image: $inputImage)
        }
        .onChange(of: inputImage) {  _ in
            loadImage()
        }
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
        
        UIImageWriteToSavedPhotosAlbum(inputImage, nil, nil, nil)
    }
}

#Preview {
    LessionThirteen()
}
