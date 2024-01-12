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
        VStack {
            Text(exercise.name)
                .font(.title)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
            Text(exercise.equipment)
                .font(.subheadline)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
        }
    }
}

#Preview {
    ExerciseListRow(exercise: Exercise(id: "1", name: "Squat", equipment: "Dumbbell", movement: "Pull", targetMuscle: "Legs", type: "Weight Lifting"))
}
