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
    }

}
