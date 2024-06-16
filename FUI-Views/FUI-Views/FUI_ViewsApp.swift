//
//  FUI_ViewsApp.swift
//  FUI-Views
//
//  Created by IVAN CAMPOS on 6/15/24.
//

import SwiftUI

@main
struct FUI_ViewsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .persistentSystemOverlays(.hidden)
        }
        .windowStyle(.plain)
        
        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
    }
}
