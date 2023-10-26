//
//  Lesson Fourteen.swift
//  Checker
//
//  Created by Daniil Kulikovskiy on 24.10.2023.
//

import SwiftUI
import LocalAuthentication

struct LessonFourteen: View {
    @State private var isUnlocked = false
    
    var body: some View {
        VStack {
            if isUnlocked {
                Text("Unclock")
            } else {
                Text("Locked")
            }
        }
        .onAppear(perform: {
            aunthenticate()
        })
    }
    
    func aunthenticate() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "We need to unlock your data"
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenficationError in
                if success {
                    isUnlocked = true
                } else {
                    
                }
            }
        } else {
            
        }
    }
}

#Preview {
    LessonFourteen()
}
