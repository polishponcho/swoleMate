//
//  AddExercise.swift
//  swoleMate
//
//  Created by Ryan Ratajczyk on 12/29/23.
//

import SwiftUI


struct AddExercise: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var exerciseVM: ExerciseVM
    var equipmentTypes = ["Barbell", "Dumbbell", "Machine", "Olympic Barbell"]
    var movements = ["Push", "Pull"]
    var targetMuscleGroups = ["Arms", "Shoulders", "Legs", "Chest", "Back"]
    var types = ["Weight Lifting", "Cardio", "Calisthenics"]
    @State private var exerciseName = ""
    @State private var equipment = "Barbell"
    @State private var movement = "Push"
    @State private var targetMuscle = "Arms"
    @State private var type = "Weights"

    var body: some View {
            VStack {
                Text("New Exercise")
                    .font(.title)
                    Form {
                        TextField("Exercise Name", text: $exerciseName)
                            .font(.headline)
                            .padding()
                        Picker("Equipment", selection: $equipment) {
                            ForEach(equipmentTypes, id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(.menu)
                        .padding()
                        Picker("Movement", selection: $movement) {
                            ForEach(movements, id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(.menu)
                        .padding()
                        Picker("Target Muscle", selection: $targetMuscle) {
                            ForEach(targetMuscleGroups, id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(.menu)
                        .padding()
                        Picker("Type", selection: $type) {
                            ForEach(types, id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(.menu)
                        .padding()
                    }

                Button(action: saveButtonPressed, label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                        .padding()
                })
            }
    }
    
    func saveButtonPressed() {
        exerciseVM.addExercise(name: exerciseName, equipment: equipment, movement: movement, targetMuscle: targetMuscle, type: type)
        presentationMode.wrappedValue.dismiss()
    }
}

#Preview {
    AddExercise()
        .environmentObject(ExerciseVM())
}
