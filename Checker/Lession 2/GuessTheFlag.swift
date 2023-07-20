//
//  GuessTheFlag.swift
//  Checker
//
//  Created by Daniil Kulikovskiy on 20.07.2023.
//

import SwiftUI

struct GuessTheFlag: View {
    var body: some View {
        ZStack {
            Color.red
                .frame(width: 200, height: 200)
            Text("Your Content")
        }
    }
}

struct GuessTheFlag_Previews: PreviewProvider {
    static var previews: some View {
        GuessTheFlag()
    }
}
