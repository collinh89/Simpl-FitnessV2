//
//  ExerciseViewViewModel.swift
//  Simpl Fitness
//
//  Created by Collin Holthaus on 6/11/23.
//

import FirebaseFirestore
import Foundation

class ExerciseViewViewModel: ObservableObject{
    private let userId: String
    @Published var showingNewItemView = false
    @Published var categories: Set<String> = []
    @Published var exercises: [Exercise] = []

    
    init(userId: String){
        self.userId = userId
    }
    
    func delete(id: String){
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("exercises")
            .document(id)
            .delete()
    }
    
    func getCategories(exercises: [Exercise]){
        let categoryArr = exercises.map {(exercise) -> String in
            return exercise.category
        }
        categories = Set<String>(categoryArr)
    }
    
    func getExercises(){
        self.exercises = []
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
                        self.exercises.append(exercise)
                    }
                    self.getCategories(exercises: self.exercises)
                }
            }
    }  
}
