//
//  ExerciseListRow.swift
//  swoleMate
//
//  Created by Ryan Ratajczyk on 12/29/23.
//

import SwiftUI

struct ExerciseListRow: View {

    var exercise: Exercise
    
    var body: some View {
        HStack {
            Text(exercise.name)
                .padding()
        }
    }
}

//#Preview {
//    ExerciseListRow(exercise: Exercise(id: "1", name: "Squat", equipment: "Dumbbell", movement: "Pull", targetMuscle: "Legs", type: "Weight Lifting"))
//}
