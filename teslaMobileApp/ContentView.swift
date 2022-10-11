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
                VStack(spacing: 20){
                    // home header
                    HomeHeader()
                    CustomDivider()
                    CarSection()
                    CustomDivider()
                }.padding()
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
            HStack {
                GeneralButton(icon: "lock.fill")
                GeneralButton(icon: "gear")
            }
        }
        .padding()
    }
}

struct GeneralButton: View {
    var icon: String
    var body: some View {
        Image(systemName: icon)
            .imageScale(.large)
            .frame(width: 44, height: 44)
            .background(.white.opacity(0.05))
            .clipShape(Circle())
            .overlay(Circle().stroke(.white.opacity(0.1), lineWidth: 0.5 ))
    }
}

struct CustomDivider: View {
    var body: some View {
        Rectangle()
            .frame(maxWidth: .infinity)
            .frame(height: 0.25)
            .background(.white)
            .opacity(0.1)
    }
}

struct CarSection: View {
    var body: some View {
        VStack(spacing: 10) {
            HStack(alignment: .center) {
                HStack {
                    Image(systemName: "battery.75")
                    Text("237 miles".uppercased())
                }
                .foregroundColor(Color("Green"))
                .font(.system(size: 14, weight: .semibold, design: .rounded))
                Spacer()
                VStack(alignment: .trailing) {
                    Text("Parked")
                        .fontWeight(.semibold)
                    Text("Last updated: 5 min ago")
                        .font(.caption2)
                        .foregroundColor(.gray)
                }
            }
            Image("teslaCar1")
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
    }
}
