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
            VoiceCommandButton()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


 

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
                    .background(.green)
                    .clipShape(Circle())
                    .padding()
                    .shadow(radius: 10)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}
