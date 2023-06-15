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
    
}
