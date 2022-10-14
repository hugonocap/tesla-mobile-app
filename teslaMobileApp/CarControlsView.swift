//
//  CarControlsView.swift
//  teslaMobileApp
//
//  Created by Hugo on 14.10.22.
//

import SwiftUI

let carControls: [ActionItem] = [
    ActionItem(icon: "flashlight.on.fill", text: "Flash"),
    ActionItem(icon: "speaker.wave.3.fill", text: "Honk"),
    ActionItem(icon: "key.fill", text: "Start"),
    ActionItem(icon: "arrow.up.bin", text: "Front Trunk"),
    ActionItem(icon: "arrow.up.square", text: "Trunk"),
]

struct CarControlsView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollView{
            VStack(spacing: 20) {
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Button(action: {presentationMode.wrappedValue.dismiss()}) {
                            GeneralButton(icon: "chevron.left")
                        }
                        Spacer()
                    }
                    Text("Car Controls")
                        .font(.title)
                        .fontWeight(.semibold)
                }
                CarLockButton()
                CustomDivider()
                CarControlsButtonsFirstRow()
                CarControlsButtonsSecondRow()
                CustomDivider()
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

struct CarControlsView_Previews: PreviewProvider {
    static var previews: some View {
        CarControlsView()
    }
}
// car lock button struct
struct CarLockButton: View {
    var body: some View {
        Button(action: {}) {
            Label("Unlock Car", systemImage: "lock.fill")
                .font(.system(size: 16, weight: .medium, design: .default))
                .frame(maxWidth: .infinity)
                .padding()
                .background(.white.opacity(0.05))
                .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
                .overlay(RoundedRectangle(cornerRadius: 14, style: .continuous)
                    .stroke(.white.opacity(0.1), lineWidth: 0.5))
        }
    }
}

struct CarControlsButtonsFirstRow: View {
    var body: some View {
        HStack {
            Spacer()
            ActionButton(item: carControls[0])
            Spacer()
            ActionButton(item: carControls[1])
            Spacer()
            ActionButton(item: carControls[2])
            Spacer()
        }
    }
}

struct CarControlsButtonsSecondRow: View {
    var body: some View {
        HStack {
            Spacer()
            ActionButton(item: carControls[3])
            Spacer()
            ActionButton(item: carControls[4])
            Spacer()
        }
    }
}
