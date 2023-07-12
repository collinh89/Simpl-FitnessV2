//
//  NewWorkoutViewViewModel.swift
//  Simpl Fitness
//
//  Created by Collin Holthaus on 6/11/23.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation

class NewWorkoutViewViewModel: ObservableObject {
    @Published var userId = ""
    @Published var name = ""
    @Published var showAlert = false
    @Published var workoutId = ""
    
    init(){
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        self.userId = uId
    }
    
    func saveWorkout(){
        let newID = UUID().uuidString
        let newWorkout = Workout(id: newID, name: name, createdDate: Date().timeIntervalSince1970)
        let db = Firestore.firestore()
    
        db.collection("users")
            .document(userId)
            .collection("workouts")
            .document(newID)
            .setData(newWorkout.asDictionary())
        workoutId = newID
    }
}
