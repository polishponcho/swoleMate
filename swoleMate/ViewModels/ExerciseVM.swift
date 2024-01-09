//
//  ExerciseVM.swift
//  swoleMate
//
//  Created by Ryan Ratajczyk on 12/29/23.
//

import Foundation

class ExerciseVM: ObservableObject {
    
    @Published var exercises: [Exercise] = [] {
        didSet {
            saveExercises()
        }
    }
    let exercisesKey: String = "exercises_list"
    init() {
        getExercises()
    }
    
    func getExercises() {
        guard
            let data = UserDefaults.standard.data(forKey: exercisesKey),
            let savedExercises = try? JSONDecoder().decode([Exercise].self, from: data)
        else { return }
        
        self.exercises = savedExercises
    }
    
    func addExercise(name: String, equipment: String, movement: String, targetMuscle: String, type: String) {
        let newExercise = Exercise(name: name, equipment: equipment, movement: movement, targetMuscle: targetMuscle, type: type)
        exercises.append(newExercise)
    }
    
    func saveExercises() {
        if let encodedData = try? JSONEncoder().encode(exercises) {
            UserDefaults.standard.set(encodedData, forKey: exercisesKey)
        }
    }
    
    func deleteExercise(exercise: Exercise) {
        exercises.removeAll(where: { $0.id == exercise.id })
    }
    
    
    func updateExercise(exercise: inout Exercise) {
        if let index = exercises.firstIndex(where: {$0.id == exercise.id}) {
            exercises[index] = exercise
        }
    }
}
