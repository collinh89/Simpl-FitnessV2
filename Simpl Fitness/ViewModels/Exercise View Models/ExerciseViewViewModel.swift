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
    
}
