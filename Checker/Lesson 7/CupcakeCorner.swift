//
//  CupcakeCorner.swift
//  Checker
//
//  Created by Daniil Kulikovskiy on 20.08.2023.
//

import SwiftUI

struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}

struct CupcakeCorner: View {
    @State private var results = [Result]()
    var body: some View {
        List(results, id: \.trackId) { track in
            VStack(alignment: .leading) {
                Text(track.trackName)
                    .font(.headline)
                Text(track.collectionName)
            }
        }
        .task {
            await loadData()
        }
    }
    func loadData() async {
        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
            print("404 URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                results = decodedResponse.results
            }
        } catch {
            print("Invalid data")
        }
    
    }
}

struct CupcakeCorner_Previews: PreviewProvider {
    static var previews: some View {
        CupcakeCorner()
    }
}
