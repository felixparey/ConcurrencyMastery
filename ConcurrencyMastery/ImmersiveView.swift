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
            let rootEntity = Entity()
            rootEntity.position.y = 1
            rootEntity.position.z = -1.5
            rootEntity.addChild(grammyEntity!)
            rootEntity.addChild(robotEntity!)
            rootEntity.addChild(planeEntity!)
            rootEntity.addChild(carEntity!)
            rootEntity.addChild(tvEntity!)
            content.add(rootEntity)
            rootEntity.children.forEach { child in
                child.setPosition([Float.random(in: 0...5), 0, 0], relativeTo: child.parent)
            }
        }
    }
}

#Preview(immersionStyle: .mixed) {
    ImmersiveView()
}
