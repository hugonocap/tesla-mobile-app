//
//  LocationView.swift
//  teslaMobileApp
//
//  Created by Hugo on 15.10.22.
//

import SwiftUI
import MapKit
// location struct
struct CarLocation: Identifiable {
    let id = UUID()
    let latitude: Double
    let longitude: Double
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}



let carLocations = [CarLocation(latitude: 34.070871, longitude: -118.403738)]

struct LocationView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var location = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 34.070871, longitude: -118.403738), span: MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001))
    
    var body: some View {
        ZStack {
            // map 
            Map(coordinateRegion: $location,
                annotationItems:  carLocations,
                annotationContent: { location in
                MapAnnotation(coordinate: location.coordinate, content: {CarPin()})
            })
            CarLocationPanel()
            
            LinearGradient(gradient:Gradient(colors: [Color("DarkGray"), Color.clear, Color.clear]), startPoint: .top, endPoint: .bottom)
                .allowsHitTesting(false)
            
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
                
struct CarPin: View {
   var body: some View {
       VStack(alignment: .center, spacing: 4 ) {
           Image(systemName: "car.fill")
               .frame(width: 36, height: 36, alignment: .center)
               .background(Color("Red"))
               .foregroundColor(.white)
               .clipShape(Circle())
           Text("Mach Five")
               .font(.footnote)
               .fontWeight(.medium)
               .padding(.horizontal, 8)
               .padding(.vertical, 4)
               .background(.black)
               .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 8, style: .continuous))
               .overlay(RoundedRectangle(cornerRadius: 8, style: .continuous).stroke(.black.opacity(0.1), lineWidth: 1))
       }
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
    }
}

struct CarLocationPanel : View {
    var body: some View {
        VStack {
            Spacer()
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Location")
                        .font(.title)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    CustomDivider()
                    Label("Rodeo Drive 468 N, Beverly Hills, CA, 90210",
                          systemImage: "location.fill")
                    .font(.footnote)
                    .opacity(0.5)
                }
                VStack(alignment: .leading, spacing: 10) {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Summon")
                            .font(.title3 )
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text("Press and hold controls to move vehicle")
                        .font(.footnote)
                        .opacity(0.5)
                    }
                }
                CustomDivider()
                Button(action: {}) {
                    FullButton(text: "Go to Target")
                }
                HStack {
                    Button(action: {}) {
                        FullButton(icon: "arrow.up")
                    }
                    Button(action: {}) {
                        FullButton(icon: "arrow.down")
                    }
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color("DarkGray"))
            .foregroundColor(.white)
        }
    }
}
