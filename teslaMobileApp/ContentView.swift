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
//                    CategoryView(title: "Quick shortcuts", showEdit: true, actionItems: quickShortcuts)
//                    CustomDivider()
//                    CustomDivider()
//                    CategoryView(title: "Recent actions", showEdit: false, actionItems: recentActions)
//                    CustomDivider()
                    AllSettings()
                    
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
            .frame(height: 0.25)
            .background(.white)
            .opacity(0.1)
    }
}
// car section struct
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
struct CategoryView: View {
        
    var title: String
    var showEdit: Bool
    
    var actionItems: [ActionItem]
        
    var body: some View {
        VStack {
            CategoryHeader(title: title, showEdit: true)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top){
                    ForEach(actionItems, id:\.self) { item in
                        ActionButton(item: item)
                    }
                }
            }
            
        }
    }
}


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

struct ActionItem: Hashable {
    var icon: String
    var text: String
}

let quickShortcuts: [ActionItem] = [
    ActionItem(icon: "bolt.fill", text: "Charging"),
    ActionItem(icon: "fanblades.fill", text: "Fan On"),
    ActionItem(icon: "music.note", text: "Media controls"),
    ActionItem(icon: "bolt.car", text: "Close Charge Port")
]

let recentActions: [ActionItem] = [
    ActionItem(icon: "arrow.up.square", text: "Open Trunk"),
    ActionItem(icon: "fanblades", text: "Fan Off"),
    ActionItem(icon: "person.fill.viewfinder", text: "Summon"),
]

struct AllSettings: View {
    var body: some View {
        VStack {
            CategoryHeader(title: "All Settings")
            LazyVGrid(columns: [GridItem(.fixed(170)), GridItem(.fixed(170))]) {
                SettingsBlock(icon: "car.fill", title: "Controls")
                SettingsBlock(icon: "fanblades.fill", title: "Climate",
                              subtitle: "INTERIOR 68° F",
                              backgroundColor: Color("Blue"))
                SettingsBlock(icon: "location.fill", title: "Location",
                              subtitle: "EMPIRE STATE BUILDING")
                SettingsBlock(icon: "checkerboard.shield", title: "Privacy",
                              subtitle: "0 EVENTS DETECTED")
                SettingsBlock(icon: "sparkles", title: "Upgrades",
                              subtitle: "3 UPGRADES AVAILABLE")
            }
        }
    }
}

struct SettingsBlock: View {
    
    var icon: String
    var title: String
    var subtitle: String = ""
    var backgroundColor: Color = .white.opacity(0.05)
    
    var body: some View {
        HStack {
            Image(systemName: icon)
            VStack(alignment: .leading) {
                Text(title)
                if !subtitle.isEmpty {
                    Text(subtitle)
                }
            }
            Spacer()
            Image(systemName: "chevron.right")
        }
        .padding()
        .background(backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .overlay(RoundedRectangle(cornerRadius: 16).stroke(.white.opacity(0.1)))
    }
}
