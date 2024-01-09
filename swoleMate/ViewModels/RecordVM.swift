//
//  RecordVM.swift
//  swoleMate
//
//  Created by Ryan Ratajczyk on 12/29/23.
//

import Foundation

class RecordVM: ObservableObject {
    
    @Published var records: [Record] = [] {
        didSet {
            saveRecords()
        }
    }
    
    let recordsKey: String = "records_list"
    init() {
        getRecords()
    }
    
    func getRecords() {
        guard
            let data = UserDefaults.standard.data(forKey: recordsKey),
            let savedRecords = try? JSONDecoder().decode([Record].self, from: data)
        else { return }
        
        self.records = savedRecords
    }
    
    func addRecord(completeDate: Date, exercise: Exercise, reps: Int, weight: Int) {
        let newRecord = Record(completeDate: completeDate, exercise: exercise, reps: reps, weight: weight)
        records.append(newRecord)
    }
    
    func saveRecords() {
        if let encodedData = try? JSONEncoder().encode(records) {
            UserDefaults.standard.set(encodedData, forKey: recordsKey)
        }
    }
    
    func deleteRecord(indexSet: IndexSet) {
        records.remove(atOffsets: indexSet)
    }
    
    func updateRecord(record: inout Record) {
        if let index = records.firstIndex(where: {$0.id == record.id }) {
            records[index] = record
        }
    }
}
