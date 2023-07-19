//
//  EditExerciseViewViewModel.swift
//  Simpl Fitness
//
//  Created by Collin Holthaus on 6/12/23.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class EditExerciseViewViewModel: ObservableObject{
    private var userId = ""
    private var exerciseId = ""
    private var workouts: [Workout] = []
    
    @Published var name = ""
    @Published var category = ""
    @Published var weight = 0
    @Published var reps = ""
    @Published var sets = ""
    @Published var showAlert = false
    
    init(){
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        self.userId = uId
    }
    func setExercise(exercise: Exercise){
        self.exerciseId = exercise.id
        self.name = exercise.name
        self.category = exercise.category
        self.weight = exercise.weight
        self.reps = exercise.reps
        self.sets = exercise.sets
    }
    
    func updateExercise(){
        let exerciseToUpdate = Exercise(
            id: exerciseId,
            name: name,
            weight: weight,
            sets: sets,
            reps: reps,
            category: category
        )
        let db = Firestore.firestore()
        db.collection("users")
            .document(self.userId)
            .collection("exercises")
            .document(self.exerciseId)
            .setData(exerciseToUpdate.asDictionary())
        
        let workouts = getWorkouts()
        
        for workout in workouts {
            db.collection("users")
                .document(self.userId)
                .collection("workouts")
                .document(workout.id)
                .collection("exercises")
                .document(self.exerciseId)
                .setData(exerciseToUpdate.asDictionary())
        }
    }
    func getWorkouts() -> [Workout]{
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("workouts")
            .getDocuments() { (querySnapshot, error) in
                if let error = error {
                    print("Error getting documents: \(error)")
                } else {
                    for document in querySnapshot!.documents {
                        let id  = document.data()["id"] as? String ?? ""
                        let name  = document.data()["name"] as? String ?? ""
                        let createdDate  = document.data()["createdDate"] as? TimeInterval ?? Date().timeIntervalSince1970
                        let exercise = Workout(
                            id: id,
                            name: name,
                            createdDate: createdDate
                        )
                        self.workouts.append(exercise)
                    }
                }
            }
        return self.workouts
    }
}
