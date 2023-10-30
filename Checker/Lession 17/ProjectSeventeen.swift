//
//  ProjectSeventeen.swift
//  Checker
//
//  Created by Daniil Kulikovskiy on 30.10.2023.
//

import SwiftUI

@MainActor class User: ObservableObject {
    @Published var name = "Taylor Swift"
}

struct EditNewView: View {
    @EnvironmentObject var user: User
    
    var body: some View {
        TextField("Name", text: $user.name)
    }
}

struct DisplayView: View {
    @EnvironmentObject var user: User
    var body: some View {
        Text(user.name)
    }
}

struct ProjectSeventeen: View {
    @StateObject private var user = User()
    
    var body: some View {
        VStack {
            EditNewView()
            DisplayView()
        }
        .environmentObject(user)
    }
}

#Preview {
    ProjectSeventeen()
}
