//
//  ImmersiveView.swift
//  ConcurrencyMastery
//
//  Created by Felix Parey on 25/03/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ImmersiveView: View {
    var body: some View {
        RealityView { content in
            imageEntity1 = ModelEntity(mesh: .generatePlane(width: 1, height: 2), materials: [SimpleMaterial(color: .red, isMetallic: false)])
            content.add(grammyEntity!)
            content.add(robotEntity!)
            content.add(planeEntity!)
            content.add(carEntity!)
            content.add(tvEntity!)
        }
    }
}

#Preview(immersionStyle: .mixed) {
    ImmersiveView()
}
