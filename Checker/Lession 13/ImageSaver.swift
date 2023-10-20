//
//  ImageSaver.swift
//  Checker
//
//  Created by Daniil Kulikovskiy on 20.10.2023.
//

import UIKit

class ImageSaver: NSObject {
    func writeToPhotoAlbun(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveCompleted), nil)
    }
    
    @objc func saveCompleted(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        print("Save Finished")
    }
}
