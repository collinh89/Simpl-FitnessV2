//
//  NewExerciseViewViewModel.swift
//  Simpl Fitness
//
//  Created by Collin Holthaus on 6/11/23.
//

import FirebaseFirestore
import FirebaseAuth
import Foundation

class NewExerciseViewViewModel:ObservableObject{
    private var userId = ""
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
    
    func saveExercise(){
        let newID = UUID().uuidString
        let newExercise = Exercise(
             id: newID,
             name: name,
             weight: weight,
             sets: sets,
             reps: reps,
             category: category
        )
        print(self.userId)
        let db = Firestore.firestore()
        db.collection("users")
            .document(self.userId)
            .collection("exercises")
            .document(newID)
            .setData(newExercise.asDictionary())
    }
}
