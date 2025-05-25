//
//  ContentView.swift
//  FUI-Views
//
//  Created by IVAN CAMPOS on 6/15/24.
//

import SwiftUI
import RealityKit

struct ContentView: View {
    
    @State private var showImmersiveSpace = false
    @State private var immersiveSpaceIsShown = false
    
    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace
    
    var body: some View {
        VStack {
            
            Text(futureScape("FUI Views"))
                .font(.custom("Orbitron", size: 48))
            
            CurrentDayView()
            
            HStack {
                CirclesExpanseView().frame(width: 400, height: 400)
                ChevronsVerticalView()
                HexagonsExpanseView().frame(width: 400, height: 400)
            }
            
            Toggle(futureScape("Show Immersive Space"), isOn: $showImmersiveSpace)
                .font(.title)
                .frame(width: 360)
                .padding(24)
                .glassBackgroundEffect()
        }
        .padding()
        .onChange(of: showImmersiveSpace) { _, newValue in
            Task {
                if newValue {
                    switch await openImmersiveSpace(id: "ImmersiveSpace") {
                    case .opened:
                        immersiveSpaceIsShown = true
                    case .error, .userCancelled:
                        fallthrough
                    @unknown default:
                        immersiveSpaceIsShown = false
                        showImmersiveSpace = false
                    }
                } else if immersiveSpaceIsShown {
                    await dismissImmersiveSpace()
                    immersiveSpaceIsShown = false
                }
            }
        }
    }
}
