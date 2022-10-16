//
//  ActionComponentsView.swift
//  teslaMobileApp
//
//  Created by Hugo on 16.10.22.
//

import SwiftUI

struct ActionComponentsView: View {
    var body: some View {
        ActionNotifications(open: .constant(true), icon: "fanblades.fill", text: "Turning on the fan...")
    }
}

struct ActionComponentsView_Previews: PreviewProvider {
    static var previews: some View {
        ActionComponentsView()
    }
}
// notification
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

