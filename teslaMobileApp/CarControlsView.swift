//
//  CarControlsView.swift
//  teslaMobileApp
//
//  Created by Hugo on 14.10.22.
//

import SwiftUI
// action items
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
                    // back button
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
                CarControlButtons()
                CustomDivider()
                ValetModeFooter()
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
// body buttons struct
struct CarControlButtons: View {
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Spacer()
                Button(action: {}) {
                    ActionButton(item: carControls[0])
                }
                Spacer()
                Button(action: {}) {
                    ActionButton(item: carControls[1])
                }
                Spacer()
                Button(action: {}) {
                    ActionButton(item: carControls[2])
                }
                Spacer()
            }
            HStack {
                Spacer()
                Button(action: {}) {
                    ActionButton(item: carControls[3])
                }
                Spacer()
                Button(action: {}) {
                    ActionButton(item: carControls[4])
                }
                Spacer()
            }
        }
        .padding(10)
    }
}
// footer struct
struct ValetModeFooter: View {
    
    @State private var toggleValet: Bool = false
    
    var body: some View {
        HStack {
            Text("Valet Mode")
                .font(.title2)
                .fontWeight(.medium)
            Spacer()
            Toggle("", isOn: $toggleValet)
                .toggleStyle(SwitchToggleStyle(tint: Color("Blue")))
        }
        if toggleValet {
            Text("Valet Mode is on!")
                .font(.caption)
        }
    }
}
