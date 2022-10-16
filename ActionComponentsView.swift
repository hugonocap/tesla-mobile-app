//
//  ActionComponentsView.swift
//  teslaMobileApp
//
//  Created by Hugo on 16.10.22.
//

import SwiftUI

struct ActionComponentsView: View {
    var body: some View {
//        ActionNotifications(open: .constant(true), icon: "fanblades.fill", text: "Turning on the fan...")
//        VoiceCommandView(open: .constant(true), text: "\"Go to Santa Monica\"")
        //MediaPlayer()
        ChargingView()
    }
}

struct ActionComponentsView_Previews: PreviewProvider {
    static var previews: some View {
        ActionComponentsView()
    }
}
// notifications struct
struct ActionNotifications: View {
    
    @Binding var open: Bool
    var icon: String
    var text: String
    
    var body: some View {
        VStack {
            Spacer()
            HStack(alignment: .center, spacing: 10) {
                Image(systemName: icon)
                Text(text)
                    .fontWeight(.medium)
                Spacer()
                Button(action: {}) {
                    Text("Cancel")
                        .font(.subheadline )
                        .opacity(0.5)
                }
            }
            .padding(20)
            .foregroundColor(.white)
            .background(Color("DarkGray"))
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            .padding()
            .padding(.bottom, 20)
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}
// voice command screen struct
struct VoiceCommandView: View {
    
    @Binding var open: Bool
    var text: String
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            Image("Wave")
                .resizable()
                .aspectRatio(contentMode: .fit)
            HStack(alignment: .bottom, spacing: 20) {
                HStack {
                    Image(systemName: "mic.fill")
                        .font(.system(size: 24, weight: .semibold, design: .default))
                    Text(text)
                        .font(.title3)
                        .fontWeight(.semibold)
                }
                .padding(.bottom, 35)
                Spacer()
                Button(action: {}) {
                    Image(systemName: "xmark")
                        .font(.system(size: 24, weight: .semibold, design: .default))
                        .frame(width: 64, height: 64)
                        .background(Color("DarkGray"))
                        .foregroundColor(.white)
                        .clipShape(Circle())
                        .padding()
                        .shadow(radius: 10)
                }
            }
            .padding()
            .background(Color("Green"))
            .foregroundColor(Color("DarkGray"))
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}
// media player struct
struct MediaPlayer: View {
    var body: some View {
        VStack {
            Spacer()
            VStack(spacing: 20) {
                HStack(alignment: .center, spacing: 10) {
                    Image("AlbumCover")
                        .resizable()
                        .frame(width: 64, height: 64)
                        .clipShape(RoundedRectangle(cornerRadius: 6))
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Ya Ya")
                            .font(.headline)
                            .fontWeight(.semibold)
                        Text("Yeat - Up 2 Me")
                            .font(.footnote)
                            .fontWeight(.medium )
                            .opacity(0.5)
                    }
                    Spacer()
                }
                VStack(spacing: 5) {
                    HStack {
                        Text("0:58")
                        Spacer()
                        Text("-1:20")
                    }
                    .font(.system(size: 12, weight: .medium, design: .monospaced))
                    .opacity(00.5)
                    ZStack(alignment: .leading) {
                        Color.white.opacity(0.25)
                            .frame(height: 6)
                            .clipShape(Capsule())
                        Color("Green")
                            .frame(maxWidth: 190)
                            .frame(height: 6)
                            .clipShape(Capsule())
                        Color.white
                            .frame(width: 16, height: 16)
                            .clipShape(Circle())
                            .offset(x: 182)
                    }
                }
                CustomDivider()
                HStack {
                    HStack(alignment: .center, spacing: 15) {
                        Button(action: {}) {
                            Image(systemName: "backward.fill")
                                .font(.system(size: 20, weight: .semibold, design: .default))
                                .opacity(0.5)
                        }
                        Button(action: {}) {
                            Image(systemName: "pause.fill")
                                .font(.system(size: 20, weight: .semibold, design: .default))
                        }
                        Button(action: {}) {
                            Image(systemName: "forward.fill")
                                .font(.system(size: 20, weight: .semibold, design: .default))
                                .opacity(0.5)
                        }
                    }
                    Spacer()
                    HStack(alignment: .center, spacing: 15) {
                        Button(action: {}) {
                            Image(systemName: "minus")
                                .font(.system(size: 20, weight: .semibold, design: .default))
                                .opacity(0.5)
                        }
                        Button(action: {}) {
                            Image(systemName: "speaker.wave.2.fill")
                                .font(.system(size: 20, weight: .semibold, design: .default))
                        }
                        Button(action: {}) {
                            Image(systemName: "plus")
                                .font(.system(size: 20, weight: .semibold, design: .default))
                                .opacity(0.5)
                        }
                    }
                }
            }
            .padding(.bottom , 20)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color("DarkGray"))
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 16))
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct ChargingView: View {
    var body: some View {
        VStack {
            Spacer()
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing:10) {
                    Label("237 miles", systemImage: "bolt.fill")
                        .font(.system(size: 24, weight: .semibold, design: .default))
                    .foregroundColor(Color("Green"))
                    Text("3h 55m remain – 32/3A – 30 mi/hour")
                        .fontWeight(.medium)
                }
                
                
                VStack(alignment: .leading, spacing: 5) {
                
                    Text("Charge Limit: 315 miles")
                        .fontWeight(.semibold)
                        .font(.system(size: 15, weight: .medium, design: .default))
                        .opacity(00.5)
                    
                    ZStack(alignment: .leading) {
                        Color.white.opacity(0.25)
                            .frame(height: 6)
                            .clipShape(Capsule())
                        Color("Green")
                            .frame(maxWidth: 300)
                            .frame(height: 6)
                            .clipShape(Capsule())
                        Color.white
                            .frame(width: 16, height: 16)
                            .clipShape(Circle())
                            .offset(x: 340)
                    }
                }
                CustomDivider()
                Button(action: {}) {
                    Text("Stop Charging")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 14)
                        .background(Color("Red"))
                        .clipShape(Capsule())
                }
                .frame(maxWidth: .infinity)
            }
            .padding(.bottom , 20)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color("DarkGray"))
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 16))
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}
