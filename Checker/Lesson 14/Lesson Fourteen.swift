//
//  Lesson Fourteen.swift
//  Checker
//
//  Created by Daniil Kulikovskiy on 24.10.2023.
//

import SwiftUI


struct LessonFourteen: View {
   
    
    
    var body: some View {
        Text("Hello")
            .onTapGesture {
                let str = "Test message"
                let url = getDocumentsDirectory().appendingPathComponent("message.txt")
                
                do {
                    try str.write(to: url, atomically: true, encoding: .utf8)
                    let input = try String(contentsOf: url)
                    print(input)
                } catch {
                    print(error.localizedDescription)
                }
            }
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}

#Preview {
    LessonFourteen()
}
