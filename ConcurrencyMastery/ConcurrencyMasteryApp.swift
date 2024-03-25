//
//  ConcurrencyMasteryApp.swift
//  ConcurrencyMastery
//
//  Created by Felix Parey on 25/03/24.
//

import SwiftUI

@main
struct ConcurrencyMasteryApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
    }
}
