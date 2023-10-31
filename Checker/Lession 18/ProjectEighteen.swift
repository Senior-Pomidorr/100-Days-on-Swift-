//
//  ProjectEighteen.swift
//  Checker
//
//  Created by Daniil Kulikovskiy on 31.10.2023.
//

import SwiftUI
import UserNotifications

struct ProjectEighteen: View {
    var body: some View {
        VStack {
            Button("Request Permission") {
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        print("All set!")
                    } else if let error = error {
                        print(error.localizedDescription)
                    }
                }
            }
            
            Button("Schedule Notifiacation") {
                let content = UNMutableNotificationContent()
                content.title = "Feed the dogs"
                content.subtitle = "They look hungry"
                content.sound = UNNotificationSound.default
                
                let triger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: triger)
                
                UNUserNotificationCenter.current().add(request)
            }
        }
    }
}

#Preview {
    ProjectEighteen()
}
