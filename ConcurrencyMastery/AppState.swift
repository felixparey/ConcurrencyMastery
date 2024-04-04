//
//  AppState.swift
//  ConcurrencyMastery
//
//  Created by Felix Parey on 25/03/24.
//

import Foundation
import RealityKit
import RealityKitContent
import SwiftUI

@Observable
class AppState{
    
    //Loads all Entities in a synchronous Task one by one
    func loadWithSingleTask() async{
        let start = CFAbsoluteTimeGetCurrent()
        robotEntity = try? await Entity(named: "robot_walk_idle", in: realityKitContentBundle)
        print("Robot Loaded")
        planeEntity = try? await Entity(named: "toy_biplane_idle", in: realityKitContentBundle)
        print("Plane Loaded")
        carEntity = try? await Entity(named: "toy_car", in: realityKitContentBundle)
        print("Car Loaded")
        tvEntity = try? await Entity(named: "tv_retro", in: realityKitContentBundle)
        print("TV Loaded")
        grammyEntity = try? await Entity(named: "gramophone", in: realityKitContentBundle)
        print("Grammy Loaded")
        if let _ = robotEntity, (planeEntity != nil), (carEntity != nil), (tvEntity != nil), (grammyEntity != nil){
            print("All Entities loaded")
        }else{
            print("NOT all entites loaded")
        }
        let end = CFAbsoluteTimeGetCurrent() - start
        print("it took \(end) seconds to execute")
    }
    
    //Splits the loading of all Entites into different threats
    func loadSpaceWithTaskGroup() async{
        let start = CFAbsoluteTimeGetCurrent()
        await withTaskGroup(of: Void.self) { taskGroup in
            taskGroup.addTask {
                robotEntity = try? await Entity(named: "robot_walk_idle", in: realityKitContentBundle)
                print("Robot Loaded")
            }
            taskGroup.addTask {
                planeEntity = try? await Entity(named: "toy_biplane_idle", in: realityKitContentBundle)
                print("Plane Loaded")
            }
            taskGroup.addTask {
                carEntity = try? await Entity(named: "toy_car", in: realityKitContentBundle)
                print("Car Loaded")
            }
            taskGroup.addTask {
                tvEntity = try? await Entity(named: "tv_retro", in: realityKitContentBundle)
                print("TV Loaded")
            }
            taskGroup.addTask {
                grammyEntity = try? await Entity(named: "gramophone", in: realityKitContentBundle)
                print("Grammy Loaded")
            }
            
            await taskGroup.waitForAll()
            if let _ = robotEntity, (planeEntity != nil), (carEntity != nil), (tvEntity != nil), (grammyEntity != nil){
                print("All Entities loaded")
            }else{
                print("NOT all entites loaded")
            }
            
            
        }
        let end = CFAbsoluteTimeGetCurrent() - start
        print("it took \(end) seconds to execute")
        
    }
}
