//
//  ExerciseList.swift
//  swoleMate
//
//  Created by Ryan Ratajczyk on 12/29/23.
//

import SwiftUI



struct ExerciseList: View {
    
    @EnvironmentObject var exerciseVM: ExerciseVM
    
    
    var body: some View {
        VStack {
            if exerciseVM.exercises.isEmpty {
                Text("Add an Exercise")
            } else {
                Text("Exercises")
                List {
                    ForEach(exerciseVM.exercises.indices, id: \.self) { index in
                        NavigationLink(destination: ExerciseDetail(exercise: exerciseVM.exercises[index])) {
                            ExerciseListRow(exercise: exerciseVM.exercises[index])
                        }
                    }
                }
                .listStyle(.inset)
            }
        }
        .navigationBarItems(
//            leading: EditButton(),
            trailing: NavigationLink("Add", destination: AddExercise())
        )
    }
}



#Preview {
    ExerciseList()
        .environmentObject(ExerciseVM())
}

