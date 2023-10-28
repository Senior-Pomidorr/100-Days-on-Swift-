//
//  ContentView + ViewModel.swift
//  Checker
//
//  Created by Daniil Kulikovskiy on 28.10.2023.
//

import Foundation
import MapKit

extension LessionFifteen {
    @MainActor class ViewModel: ObservableObject {
        @Published var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 50, longitude: 0), span: MKCoordinateSpan(latitudeDelta: 25, longitudeDelta: 25))
        @Published private(set) var locations = [Location]()
        @Published var selectedPlace: Location?
        let savePath = FileManager.documentsDirectory.appendingPathComponent("SavePlaces")
        
        init() {
            do {
                let data = try Data(contentsOf: savePath)
                locations = try JSONDecoder().decode([Location].self, from: data)
            } catch {
                locations = []
            }
        }
        
        func addLocation() {
            let newLocation = Location(id: UUID(), name: "New Location", description: "", latitude: mapRegion.center.latitude, longitude: mapRegion.center.longitude)
            locations.append(newLocation)
        }
        
        func upadte(_ location: Location) {
            guard let selectedPlace = selectedPlace else { return }
            
            
            if let index = locations.firstIndex(of: selectedPlace) {
                locations[index] = location
            }
        }
    }
}
