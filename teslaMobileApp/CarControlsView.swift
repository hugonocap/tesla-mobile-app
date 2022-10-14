//
//  CarControlsView.swift
//  teslaMobileApp
//
//  Created by Hugo on 14.10.22.
//

import SwiftUI

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
                CustomDivider()
                CarLockButton()
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
