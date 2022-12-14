//
//  ContentView.swift
//  teslaMobileApp
//
//  Created by Hugo on 11.10.22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var openVoiceCommand = false
    @State private var openMedia = false
    @State private var openCharging = false
    
    @State private var openAction = false
    @State private var actionText = ""
    @State private var actionIcon = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    VStack(spacing: 20){
                        // home header
                        HomeHeader()
                        CustomDivider()
                        CarSection(openCharging: $openCharging)
                        CustomDivider()
                        CategoryView(openAction: $openAction, actionText: $actionText,
                                     actionIcon: $actionIcon, openCharging: $openCharging,
                                     openMedia: $openMedia, title: "Quick Shortcuts",
                                     showEdit: true, actionItems: quickShortcuts)
                        CustomDivider()
                        CategoryView(openAction: $openAction, actionText: $actionText,
                                     actionIcon: $actionIcon, openCharging: $openCharging,
                                     openMedia: $openMedia, title: "Recent actions",
                                     showEdit: false, actionItems: recentActions)
                        CustomDivider()
                        AllSettings()
                        ReorderButton()
                    }.padding()
                }
                // voice command button
                VoiceCommandButton(open: $openVoiceCommand)
                
                if (openVoiceCommand || openCharging || openMedia || openAction) {
                    Color.black.opacity(0.5)
                        .ignoresSafeArea()
                        .transition(.opacity)
                        .onTapGesture {
                            withAnimation {
                                openVoiceCommand = false
                                openCharging = false
                                openMedia = false
                                openAction = false
                            }
                        }
                }
                
                if openVoiceCommand {
                    VoiceCommandView(open: $openVoiceCommand, text: "take me to olive garden")
                        .zIndex(1)
                }
                
                
                if openCharging {
                    ChargingView()
                        .transition(.move(edge: .bottom))
                        .zIndex(1)
                }
                
                if openMedia {
                    MediaPlayer()
                        .transition(.move(edge: .bottom))
                        .zIndex(1)
                }
                
                if openAction && !actionText.isEmpty {
                    ActionNotifications(open: $openAction, icon: actionIcon, text: actionText)
                        .transition(.move(edge: .bottom))
                        .zIndex(1)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("DarkGray"))
            .foregroundColor(.white)
            .navigationTitle("Mach Five")
            .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
// voice button struct
struct VoiceCommandButton: View {
    
    @Binding var open: Bool
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Button(action: {
                    withAnimation {
                        open = true
                    }
                }) {
                    Image(systemName: "mic.fill")
                        .font(.system(size: 24, weight: .semibold, design: .default))
                        .frame(width: 64, height: 64)
                        .background(Color("Green"))
                        .foregroundColor(Color("DarkGray"))
                        .clipShape(Circle())
                        .padding()
                        .shadow(radius: 10)
                }
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
                Button(action: {}) {
                    GeneralButton(icon: "lock.fill")
                }
                Button(action: {}) {
                    GeneralButton(icon: "gear")
                }
            }
        }
        .padding()
    }
}
// car section struct
struct CarSection: View {
    
    @Binding var openCharging: Bool
    
    var body: some View {
        VStack(spacing: 10) {
            HStack(alignment: .center) {
                Button(action: {
                    openCharging = true
                }) {
                    Label("237 miles".uppercased(), systemImage: "battery.75")
                        .font(.system(size: 14, weight: .semibold, design: .rounded))
                        .foregroundColor(Color("Green"))
                }
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
// category header struct
struct CategoryHeader: View {
    
    var title: String
    var showEdit: Bool = false
    
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Text(title)
                    .font(.title2)
                    .fontWeight(.semibold)
                Spacer()
                if showEdit {
                    Button(action: {}) {
                        Text("Edit")
                            .foregroundColor(.gray)
                            .fontWeight(.medium)
                        
                    }
                }
            }
        }
    }
}
// category view struct
struct CategoryView: View {
    
    @Binding var openAction: Bool
    @Binding var actionText: String
    @Binding var actionIcon: String
    
    @Binding var openCharging: Bool
    @Binding var openMedia: Bool
    
    var title: String
    var showEdit: Bool
    
    var actionItems: [ActionItem]
    
    var body: some View {
        VStack {
            CategoryHeader(title: title, showEdit: true)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top) {
                    if title ==   "Quick Shortcuts" {
                        Button(action: {
                            openCharging = true
                        }) {
                            ActionButton(item: chargingShortcut)
                        }
                        Button(action: {
                            openMedia = true
                        }) {
                            ActionButton(item: mediaShortcut)
                        }
                    }
                    ForEach(actionItems, id:\.self) { item in
                        Button(action: {
                            withAnimation {
                                openAction = true
                                actionIcon = item.icon
                                actionText = item.text
                            }
                        }) {
                            ActionButton(item: item)
                        }
                    }
                }
            }
            
        }
    }
}
// action item 1
let quickShortcuts: [ActionItem] = [
    ActionItem(icon: "fanblades.fill", text: "Fan On"),
    ActionItem(icon: "bolt.car", text: "Close Charge Port")
]
let chargingShortcut = ActionItem(icon: "bolt.fill", text: "Charging")
let mediaShortcut = ActionItem(icon: "music.note", text: "Media controls")
// action item 2
let recentActions: [ActionItem] = [
    ActionItem(icon: "arrow.up.square", text: "Open Trunk"),
    ActionItem(icon: "fanblades", text: "Fan Off"),
    ActionItem(icon: "person.fill.viewfinder", text: "Summon"),
]

// all settings struct
struct AllSettings: View {
    var body: some View {
        VStack {
            CategoryHeader(title: "All Settings")
            LazyVGrid(columns: [GridItem(.fixed(180)), GridItem(.fixed(180))]) {
                NavigationLink(destination: CarControlsView()) {
                    SettingsBlock(icon: "car.fill", title: "Controls", subtitle: "Car locked")
                }
                SettingsBlock(icon: "fanblades.fill", title: "Climate",
                              subtitle: "INTERIOR 68?? F",
                              backgroundColor: Color("Blue"))
                NavigationLink(destination: LocationView()) {
                    SettingsBlock(icon: "location.fill",
                        title: "Location",
                        subtitle: "BEVERLY HILLS")
                }
                SettingsBlock(icon: "checkerboard.shield", title: "Privacy",
                              subtitle: "0 EVENTS DETECTED")
                SettingsBlock(icon: "sparkles", title: "Upgrades",
                              subtitle: "3 UPGRADES AVAILABLE")
            }
        }
    }
}
// settings block struct
struct SettingsBlock: View {
    
    var icon: String
    var title: String
    var subtitle: String = ""
    var backgroundColor: Color = .white.opacity(0.05)
    
    var body: some View {
        HStack(alignment: .center, spacing: 2) {
            Image(systemName: icon)
            VStack(alignment: .leading) {
                // title
                Text(title)
                    .fontWeight(.semibold)
                    .fixedSize(horizontal: true, vertical: false)
                    .font(.system(size: 16, weight: .medium, design: .default))
                // subtitle
                Text(subtitle.uppercased())
                    .font(.system(size: 8, weight: .medium, design: .default))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .lineLimit(1)
            }
            .padding(.leading, 5)
            Spacer()
            Image(systemName: "chevron.right")
        }
        .padding(19)
        .background(backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .overlay(RoundedRectangle(cornerRadius: 16).stroke(.white.opacity(0.1),
                                                           lineWidth: 0.5))
    }
}
// reorder button struct
struct ReorderButton: View {
    var body: some View {
        Button(action: {}) {
            Text("Reorder Groups")
                .font(.caption)
                .padding(.vertical, 8)
                .padding(.horizontal, 14)
                .background(.white.opacity(0.05))
                .clipShape(Capsule())
                .overlay(RoundedRectangle(cornerRadius: 16).stroke(.white.opacity(0.1),
                                                                   lineWidth: 0.5))
        }
    }
}
