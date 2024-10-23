//
//  MapView.swift
//  SwiftUIPlayground
//
//  Created by Sachin Sharma on 08/06/24.
//

import SwiftUI
import MapKit
import CoreLocation


struct MapView: View {
    let encodedPolyline = "oaylDcwquMUTg@VoB|CARELy@dAsAjBOFOAe@LWNY`@Of@Gf@OhAQ~@I\\I`@g@hBgAbCKVURKBSCi@EM@_@PWFEu@c@cHAkD\\_IAKEIGG_@KL[b@{AD}@A{@e@sGM{DIeGUyDCM^IJnAJrBB~@^@"
    var body: some View {
        MapKitView(
                   pickupLocation: CLLocationCoordinate2D(latitude: 28.477653, longitude: 77.10058600000001),  // Example coordinates
                   dropLocation: CLLocationCoordinate2D(latitude: 28.4819276, longitude: 77.1045127),
                   encodedPolyline: encodedPolyline  // Your actual encoded polyline string
               )
               .edgesIgnoringSafeArea(.all)
    }
}


#Preview {
    MapView()
}



struct MapKitView: UIViewRepresentable {
    var pickupLocation: CLLocationCoordinate2D
    var dropLocation: CLLocationCoordinate2D
    var encodedPolyline: String
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        uiView.removeAnnotations(uiView.annotations)
        uiView.removeOverlays(uiView.overlays)
        
        let pickupAnnotation = MKPointAnnotation()
        pickupAnnotation.coordinate = pickupLocation
        pickupAnnotation.title = "Pickup"
        uiView.addAnnotation(pickupAnnotation)
        
        let dropAnnotation = MKPointAnnotation()
        dropAnnotation.coordinate = dropLocation
        dropAnnotation.title = "Drop"
        uiView.addAnnotation(dropAnnotation)
        
        if let path = decodePolyline(encodedPolyline) {
            let polyline = MKPolyline(coordinates: path, count: path.count)
            uiView.addOverlay(polyline)
            uiView.setVisibleMapRect(polyline.boundingMapRect, edgePadding: UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20), animated: true)
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapKitView

        init(_ parent: MapKitView) {
            self.parent = parent
        }

        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            if let polyline = overlay as? MKPolyline {
                let renderer = MKPolylineRenderer(polyline: polyline)
                renderer.strokeColor = .orange
                renderer.lineWidth = 4.0
                return renderer
            }
            return MKOverlayRenderer()
        }
    }
}

func decodePolyline(_ encoded: String) -> [CLLocationCoordinate2D]? {
    var coordinates = [CLLocationCoordinate2D]()
    var index = encoded.startIndex
    var lat = 0
    var lng = 0

    while index < encoded.endIndex {
        let (latResult, newIndex1) = decodeComponent(from: encoded, startingAt: index)
        lat += latResult
        let (lngResult, newIndex2) = decodeComponent(from: encoded, startingAt: newIndex1)
        lng += lngResult
        coordinates.append(CLLocationCoordinate2D(latitude: Double(lat) / 1E5, longitude: Double(lng) / 1E5))
        index = newIndex2
    }
    return coordinates
}

func decodeComponent(from encoded: String, startingAt index: String.Index) -> (result: Int, nextIndex: String.Index) {
    var index = index
    var result = 0
    var shift = 0
    var byte: UInt8

    repeat {
        byte = encoded[index].asciiValue! - 63
        result |= Int(byte & 0x1F) << shift
        shift += 5
        encoded.formIndex(after: &index)
    } while byte >= 0x20
    return (((result & 1) == 1) ? ~(result >> 1) : (result >> 1), index)
}


