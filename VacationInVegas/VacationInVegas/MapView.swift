//
//  ContentView.swift
//  VacationInVegas
//
//  Created by javier on 2024/10/13.
//

import SwiftUI
import MapKit

struct MapView: View {
    var place: Place
    
    @State var position: MapCameraPosition
    
    var body: some View {
        Map(position: $position) {
            Annotation(place.interested ? "place of insterest" : "not insterest", coordinate: place.location) {
                ZStack {
                    RoundedRectangle(cornerRadius: 7)
                        .fill(.ultraThinMaterial)
                        .stroke(.secondary, lineWidth: 5)
                    Image(systemName: place.interested
                          ? "face.smiling" : "hand.thumbsdown")
                    .padding(3)
                }
                .onTapGesture {
                    place.interested.toggle()
                }
            }
        }
        .toolbarBackground(.automatic)
    }
}

#Preview {
    @Previewable @State var place = Place.previewPlaces[1]
    
    MapView(place: Place.previewPlaces[1], position: .camera(MapCamera(
        centerCoordinate: place.location, distance: 1000,
        heading: 250,
        pitch: 80
    )))
}
