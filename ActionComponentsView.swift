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
        VoiceCommandView(open: .constant(true), text: "\"Go to Santa Monica\"")
    }
}

struct ActionComponentsView_Previews: PreviewProvider {
    static var previews: some View {
        ActionComponentsView()
    }
}
// notification struct
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
