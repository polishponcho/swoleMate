//
//  ExerciseDetailView.swift
//  swoleMate
//
//  Created by Ryan Ratajczyk on 12/29/23.
//

import SwiftUI

struct ExerciseDetail: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var recordVM: RecordVM
    @State var showAddRecordView: Bool = false
    @State private var reps: String = ""
    @State private var weight: String = ""
    @State var exercise: Exercise
    var records: [Record] {
        return recordVM.records.filter{$0.exercise.id == exercise.id}
    }
    
    var body: some View {
        VStack {
            Text(exercise.name)
                .padding()
            List {
                ForEach(records.indices, id: \.self) { index in
                    Text("Reps: \(records[index].reps)/Weight: \(records[index].weight)")
                    
                }
                .onDelete(perform: recordVM.deleteRecord)
            }
            Button("Add Record") {
                showAddRecordView = true
            }
            .popover(isPresented: $showAddRecordView) {
                VStack {
                    Text("Add new record for \(exercise.name)")
                        .font(.title)
                        .padding()
                    TextField("Reps", text: $reps)
                        .padding()
                    TextField("Weight", text: $weight)
                        .padding()
                    Button(action: saveButtonPressed, label: {
                        Text("Save".uppercased())
                            .foregroundColor(.white)
                            .font(.headline)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(Color.accentColor)
                            .cornerRadius(10)
                            .padding()
                    }).disabled(reps.isEmpty || weight.isEmpty)
                }
            }
        }
    }
    
    func saveButtonPressed() {
        recordVM.addRecord(completeDate: Date.now, exercise: exercise, reps: Int(reps)!, weight: Int(weight)!)
        presentationMode.wrappedValue.dismiss()
    }
}

#Preview {
    ExerciseDetail(exercise: Exercise(id: "1", name: "Squat", equipment: "Barbell", movement: "Push", targetMuscle: "Legs", type: "Weight lifting"))
        .environmentObject(RecordVM())
}
