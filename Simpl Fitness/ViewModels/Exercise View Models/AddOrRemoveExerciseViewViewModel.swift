//
//  AddOrRemoveExerciseViewViewModel.swift
//  Simpl Fitness
//
//  Created by Collin Holthaus on 6/15/23.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class AddOrRemoveExerciseViewViewModel: ObservableObject {
    private var userId = ""
    @Published var allExercises: [Exercise] = []
    @Published var categories: Set<String> = []
    
    init(){
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        self.userId = uId
        
        self.getAllExercises()
    }
    func getCategories(){
        let categoryArr = self.allExercises.map {(exercise) -> String in
            return exercise.category
        }
        self.categories = Set<String>(categoryArr)
    }
    
    func addExercisesToWorkout(workoutId: String, exerciseToAdd: Exercise){
        let exerciseIdx = allExercises.firstIndex(of: exerciseToAdd) ?? -1
        if(exerciseIdx != -1){
            allExercises.remove(at: exerciseIdx)
        }
        
        let db = Firestore.firestore()

        db.collection("users")
            .document(userId)
            .collection("workouts")
            .document(workoutId)
            .collection("exercises")
            .document(exerciseToAdd.id)
            .setData(exerciseToAdd.asDictionary())
    }
    
    func getAllExercises(){
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("exercises")
            .getDocuments() { (querySnapshot, error) in
                if let error = error {
                    print("Error getting documents: \(error)")
                } else {
                    for document in querySnapshot!.documents {
                        let id  = document.data()["id"] as? String ?? ""
                        let name  = document.data()["name"] as? String ?? ""
                        let weight  = document.data()["weight"] as? String ?? ""
                        let sets  = document.data()["sets"] as? String ?? ""
                        let reps  = document.data()["reps"] as? String ?? ""
                        let category  = document.data()["category"] as? String ?? ""
                        let exercise = Exercise(
                            id: id,
                            name: name,
                            weight: weight,
                            sets: sets,
                            reps: reps,
                            category: category
                        )
                        self.allExercises.append(exercise)
                    }
                    self.getCategories()
                }
            }
    }
    
    func delete(workoutId: String, exerciseRemoved: Exercise){
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("workouts")
            .document(workoutId)
            .collection("exercises")
            .document(exerciseRemoved.id)
            .delete()
    }
}

