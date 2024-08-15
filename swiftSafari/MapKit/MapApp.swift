//
//  MapApp.swift
//  swiftSafari
//
//  Created by Sachin Sharma on 28/06/24.
//

import SwiftUI
import MapKit

extension CLLocationCoordinate2D {
    static let parking = CLLocationCoordinate2D(latitude: 42.354528, longitude: -71.068369)
}

struct MapApp: View {
    @State private var searchResults: [MKMapItem] = []

    var body: some View {
        Map {
            Annotation("Parking", coordinate: .parking) {
                ZStack {
                    RoundedRectangle(cornerRadius: 5)
                        .fill(.background)
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(.secondary, lineWidth: 5)
                    Image(systemName: "car")
                        .padding(5)
                }
            }
            .annotationTitles(.hidden)
            
            ForEach(searchResults, id: \.self) { result in
                Marker(item: result)
            }
        }
        .mapStyle(.standard(elevation: .realistic))
        .safeAreaInset(edge: .bottom) {
            HStack {
                Spacer()
                BeanTownButtons(searchResults: $searchResults)
                    .padding(.top)
                Spacer()
            }
            .background(.thinMaterial)
        }
        
        
    }
}

struct BeanTownButtons: View {
    @Binding var searchResults: [MKMapItem]
    var body: some View {
        HStack {
            Button {
                search(for: "playground")
            } label: {
                Label("Playgrounds", systemImage: "figure.and.child.holdinghands")
            }
            
            Button(action: {
                search(for: "beach")
            }, label: {
                Label("Beaches", systemImage: "beach.umbrella")
            })
            
        }
        .labelStyle(.iconOnly)
    }
    
    func search(for query: String) {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = query
        request.resultTypes = .pointOfInterest
        request.region = MKCoordinateRegion(
            center: .parking, span: MKCoordinateSpan(latitudeDelta: 0.0125, longitudeDelta: 0.0125))
        
        Task {
            let search = MKLocalSearch(request: request)
            let response = try? await search.start()
            searchResults = response?.mapItems ?? []
        }
    }
}


#Preview {
    MapApp()
}
