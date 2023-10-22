//
//  Lesson 14.swift
//  Checker
//
//  Created by Daniil Kulikovskiy on 22.10.2023.
//

import SwiftUI
import CoreImage.CIFilterBuiltins

struct LessionThirteen: View {
    @State private var image: Image?
    @State private var filterIntensity = 0.5
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    @State private var processedImage: UIImage?
    
    @State private var currentFilter: CIFilter = CIFilter.sepiaTone()
    let context = CIContext()
    
    @State private var showingFilterSheet = false
    
    var body: some View {
        NavigationStack {
            VStack {
                ZStack {
                    Rectangle()
                        .fill()
                    
                    Text("Tap to selected picture")
                        .foregroundStyle(.white)
                        .font(.headline)
                    
                    image?
                        .resizable()
                        .scaledToFit()
                }
                .onTapGesture {
                    showingImagePicker = true
                }
                
                HStack {
                    Text("Intensity")
                    Slider(value: $filterIntensity)
                        .onChange(of: filterIntensity) { _ in
                            applyProcessing()
                        }
                }
                .padding(.vertical)
                
                HStack {
                    Button("Change Filter") {
                        showingFilterSheet = true
                    }
                    
                    Spacer()
                    
                    Button("Save", action: save)
                        
                }
            }
            .padding([.horizontal, .bottom])
            .navigationTitle("Instafilter")
            .onChange(of: inputImage) { _ in
                loadImage()
            }
            .sheet(isPresented: $showingImagePicker, content: {
                ImagePicker(image: $inputImage)
            })
            .confirmationDialog("Select a filter", isPresented: $showingFilterSheet) {
                Button("Crysilize") { setFilter(CIFilter.crystallize())}
                Button("Edges") { setFilter(CIFilter.edges())}
                Button("Gaussin Blur") { setFilter(CIFilter.gaussianBlur())}
                Button("Pixelllate") { setFilter(CIFilter.pixellate())}
                Button("SepiaTone") { setFilter(CIFilter.sepiaTone())}
                Button("Vignetta") { setFilter(CIFilter.vignette())}
                Button("UnsharpMask") { setFilter(CIFilter.unsharpMask())}
                Button("Cancel", role: .cancel) {
                    
                }
            }
        }
    }
    func loadImage() {
        guard let inputImage = inputImage else { return }
        
        
        let beginImage = CIImage(image: inputImage)
        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
        applyProcessing()
    }
    
    func save() {
        guard let processedImage = processedImage else { return }
        let imageSaver = ImageSaver()
        imageSaver.sucessHandler = {
            print("Success")
        }
        imageSaver.errorHandler = {
            print("Oops! \($0.localizedDescription)")
        }
        imageSaver.writeToPhotoAlbun(image: processedImage)
    }
    
    func applyProcessing() {
        let inputKeys = currentFilter.inputKeys
        
        if inputKeys.contains(kCIInputIntensityKey) {
            currentFilter.setValue(filterIntensity, forKey: kCIInputIntensityKey)
        }
        if inputKeys.contains(kCIInputRadiusKey) {
            currentFilter.setValue(filterIntensity * 200, forKey: kCIInputRadiusKey)
        }
        if inputKeys.contains(kCIInputScaleKey) {
            currentFilter.setValue(filterIntensity * 10, forKey: kCIInputScaleKey)
        }
        
//        currentFilter.setValue(inputKeys, forKey: kCIInputIntensityKey)
        
        guard let outputImage = currentFilter.outputImage else { return }
        
                if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
                    let uiImage = UIImage(cgImage: cgimg)
                    image = Image(uiImage: uiImage)
                    processedImage = uiImage
                }
    }
    
    func setFilter(_ filter: CIFilter) {
        currentFilter = filter
        loadImage()
    }
}

#Preview {
    LessionThirteen()
}
