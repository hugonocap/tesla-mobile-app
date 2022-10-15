//
//  LocationView.swift
//  teslaMobileApp
//
//  Created by Hugo on 15.10.22.
//

import SwiftUI
import MapKit

struct CarLocation: Identifiable {
    let id = UUID()
    let latitude: Double
    let longitude: Double
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}

struct LocationView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State private var location = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 34.070871, longitude: -118.403738), span: MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001))
    
    var body: some View {
        ZStack {
            // map 
            Map(coordinateRegion: $location)
            VStack(alignment: .leading, spacing: 10) {
                // header
                HStack {
                    // back button
                    Button(action: {presentationMode.wrappedValue.dismiss()}) {
                        GeneralButton(icon: "chevron.left")
                    }
                    Spacer()
                    // gps volume
                    Button(action: {}) {
                        GeneralButton(icon: "speaker.wave.3.fill")
                    }
                }
                .padding()
                Spacer()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("DarkGray"))
        .foregroundColor(.white)
        .navigationTitle("Mach Five")
        .navigationBarHidden(true)
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
    }
}
