//
//  ConcurrencyMasteryApp.swift
//  ConcurrencyMastery
//
//  Created by Felix Parey on 25/03/24.
//

import SwiftUI

@main
struct ConcurrencyMasteryApp: App {
    
    @State private var appState = AppState()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(appState)
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
                .environment(appState)
        }
    }
}
