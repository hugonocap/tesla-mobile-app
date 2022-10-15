//
//  CommonComponents.swift
//  teslaMobileApp
//
//  Created by Hugo on 15.10.22.
//

import Foundation
import SwiftUI


// general buttons struct
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
// custom divider struct
struct CustomDivider: View {
    var body: some View {
        Rectangle()
            .frame(maxWidth: .infinity)
            .frame(height: 0.30)
            .background(.white)
            .opacity(0.1)
    }
}
// action button struct
struct ActionButton: View {
    
    var item: ActionItem
    
    var body: some View {
        VStack(alignment: .center) {
            GeneralButton(icon: item.icon)
            Text(item.text)
                .font(.system(size: 12, weight: .semibold, design: .default))
                .frame(width: 72)
                .multilineTextAlignment(.center)
        }
    }
}
// action item struct
struct ActionItem: Hashable {
    var icon: String
    var text: String
}
// button struct
struct FullButton: View {
    
    var text: String = ""
    var icon: String = ""
    var hasIcon: Bool = false
    
    var body: some View {
        
        if icon.isEmpty {
            textButton
        } else if text.isEmpty {
            iconButton
        } else {
            iconButton
        }
        
    }
    
    var iconButton: some View {
        Label(text, systemImage: icon)
            .font(.system(size: 16, weight: .medium, design: .default))
            .frame(maxWidth: .infinity)
            .padding()
            .background(.white.opacity(0.05))
            .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
            .overlay(RoundedRectangle(cornerRadius: 14, style: .continuous)
                .stroke(.white.opacity(0.1), lineWidth: 0.5))
    }
    
    var textButton: some View {
        Text(text )
            .font(.system(size: 16, weight: .medium, design: .default))
            .frame(maxWidth: .infinity)
            .padding()
            .background(.white.opacity(0.05))
            .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
            .overlay(RoundedRectangle(cornerRadius: 14, style: .continuous)
                .stroke(.white.opacity(0.1), lineWidth: 0.5))
    }
}
