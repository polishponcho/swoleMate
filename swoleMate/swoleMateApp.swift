//
//  swoleMateApp.swift
//  swoleMate
//
//  Created by Ryan Ratajczyk on 12/29/23.
//

import SwiftUI

@main
struct swoleMateApp: App {
    
    @StateObject var exerciseVM: ExerciseVM = ExerciseVM()
    @StateObject var recordVM: RecordVM = RecordVM()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ExerciseList()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(exerciseVM)
            .environmentObject(recordVM)
        }
    }
}
