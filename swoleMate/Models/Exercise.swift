//
//  Exercise.swift
//  swoleMate
//
//  Created by Ryan Ratajczyk on 12/29/23.
//

import Foundation

struct Exercise: Identifiable, Hashable, Encodable, Decodable {
    let id: String
    let name: String
    //equipment: Barbell, dumbbell, machine
    let equipment: String
    //movement: push/pull
    let movement: String
    //targetMuscle: arms, legs, chest, back, shoulders
    let targetMuscle: String
    //type: Weights, cardio, calisthenics
    let type: String
    
    init(id: String = UUID().uuidString, name: String, equipment: String,  movement: String, targetMuscle: String, type: String) {
        self.id = id
        self.name = name
        self.equipment = equipment
        self.movement = movement
        self.targetMuscle = targetMuscle
        self.type = type
    }
}
