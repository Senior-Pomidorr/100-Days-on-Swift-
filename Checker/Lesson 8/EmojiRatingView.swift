//
//  EmojiRatingView.swift
//  Checker
//
//  Created by Daniil Kulikovskiy on 16.09.2023.
//

import SwiftUI

struct EmojiRatingView: View {
    let rating: Int16
    var body: some View {
        switch rating {
            case 1:
                return Text("😕")
            case 2:
                return Text("🫤")
            case 3:
                return Text("😐")
            case 4:
                return Text("🙂")
            default:
               return Text("😀")
        }
    }
}

#Preview {
    EmojiRatingView(rating: 3)
}
