//
//  LocationView.swift
//  teslaMobileApp
//
//  Created by Hugo on 15.10.22.
//

import SwiftUI

struct LocationView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollView{
            VStack(spacing: 20) {
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
                }
                
            }
            .padding()
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
