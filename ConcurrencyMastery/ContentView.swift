//
//  ContentView.swift
//  ConcurrencyMastery
//
//  Created by Felix Parey on 25/03/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    
    @Environment(AppState.self) private var appState
    
    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace
    
    var body: some View {
        
        
        VStack{
            Button {
                Task(priority: .userInitiated, operation: {
                    await appState.loadSpaceWithTaskGroup()
                    await openImmersiveSpace(id: "ImmersiveSpace")
                    
                })
                
            } label: {
                Text("OpenScene")
            }

        }
        
        
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
