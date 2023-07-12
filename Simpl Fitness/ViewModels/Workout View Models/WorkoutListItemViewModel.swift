//
//  WorkoutListItemViewModel.swift
//  Simpl Fitness
//
//  Created by Collin Holthaus on 6/16/23.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class WorkoutListItemViewModel: ObservableObject{
    init(){}
    func getUserId() -> String{
        guard let userId = Auth.auth().currentUser?.uid else{
            return ""
        }
        return userId;
    }
    func UpdateExerciseOrder(exercises: [Exercise], workout: Workout){
        print(exercises)
        let updateWorkout = Workout(
            id: workout.id,
            name: workout.name,
            createdDate: workout.createdDate)
        
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(getUserId())
            .collection("workouts")
            .document(workout.id)
            .setData(updateWorkout.asDictionary())
    }
}
