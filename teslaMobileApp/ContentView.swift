//
//  ContentView.swift
//  teslaMobileApp
//
//  Created by Hugo on 11.10.22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            ScrollView{
                // home header
                HomeHeader()
                    .padding()
            }
            // voice command button
            VoiceCommandButton()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("DarkGray"))
        .foregroundColor(.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


 
// voice button struct
struct VoiceCommandButton: View {
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Image(systemName: "mic.fill")
                    .font(.system(size: 24,
                                  weight: .semibold,
                                  design: .default))
                    .frame(width: 64, height: 64)
                    .background(Color("Green"))
                    .foregroundColor(Color("DarkGray"))
                    .clipShape(Circle())
                    .padding()
                    .shadow(radius: 10)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}
// home header struct
struct HomeHeader: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("Model 3".uppercased())
                    .font(.caption2)
                    .fontWeight(.medium )
                    .padding(.vertical, 4)
                    .padding(.horizontal, 8 )
                    .background(Color("Red"))
                    .foregroundColor(.white)
                    .clipShape(Capsule())
                Text("Mach five")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
            }
            Spacer()
        }
        .padding()
    }
}
