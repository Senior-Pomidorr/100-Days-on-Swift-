//
//  DetailView.swift
//  Checker
//
//  Created by Daniil Kulikovskiy on 16.09.2023.
//

import SwiftUI

struct DetailView: View {
    let book: Book
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .bottomTrailing) {
                Image(book.genre ?? "Fantasy")
                    .resizable()
                    .scaledToFit()
                    
                Text(book.genre?.uppercased() ?? "FANTASY")
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(8)
                    .foregroundColor(.white)
                    .background(.black.opacity(0.75))
                    .clipShape(Circle())
                    .offset(x: -5, y: -5)
            }
            Text(book.author ?? "Unknown author")
                .font(.title)
                .foregroundColor(.secondary)
                .padding()
            
            Text(book.review ?? "Unknown book review")
            RaitingView(raiting: .constant(Int(book.rating)))
                .font(.largeTitle)
        }
        .navigationTitle(book.title ?? "Unknown title")
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

//#Preview {
//    DetailView()
//}
