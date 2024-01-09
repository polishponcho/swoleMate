//
//  Record.swift
//  swoleMate
//
//  Created by Ryan Ratajczyk on 12/29/23.
//

import Foundation

struct Record: Identifiable, Codable, Hashable {
    let id: String
    var completeDate: Date
    var exercise: Exercise
    var reps: Int
    var weight: Int
    
    init(id: String = UUID().uuidString, completeDate: Date, exercise: Exercise, reps: Int, weight: Int) {
        self.id = id
        self.completeDate = completeDate
        self.exercise = exercise
        self.reps = reps
        self.weight = weight
    }
}
