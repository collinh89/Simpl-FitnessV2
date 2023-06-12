//
//  ExerciseSelectionViewViewModel.swift
//  Simpl Fitness
//
//  Created by Collin Holthaus on 6/11/23.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class ExerciseSelectionViewViewModel: ObservableObject{
    private var userId: String = ""
    init(){}
    
    func getExercises() -> [Exercise]{
        return [
            Exercise(id: "1", name: "Exercise 1", weight: 50, sets: "3", reps: "10", category: "Chest"),
            Exercise(id: "2", name: "Exercise 2", weight: 50, sets: "3", reps: "10", category: "Chest"),
            Exercise(id: "3", name: "Exercise 3", weight: 50, sets: "3", reps: "10", category: "Chest")
            
        ]
    }
    
    func getUserId() -> String{
        guard let userId = Auth.auth().currentUser?.uid else{
            return ""
        }
        return userId;
    }
    
    func saveWorkout(exercises: Set<Exercise>, workoutName: String, category: String) {
        let newID = UUID().uuidString
        let newWorkout = Workout(
            id: newID,
            name: workoutName,
            category: category,
            exercises: Array(exercises),
            createdDate: Date().timeIntervalSince1970)
        
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(getUserId())
            .collection("workouts")
            .document(newID)
            .setData(newWorkout.asDictionary())
    }
}
