//
//  HomeViewViewModel.swift
//  Simpl Fitness
//
//  Created by Collin Holthaus on 6/8/23.
//

import FirebaseFirestore
import Foundation

class HomeViewViewModel:ObservableObject {
    private let userId: String
    @Published var showingNewItemView = false

    
    init(userId: String){
        self.userId = userId
    }
    
    func delete(id: String){
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("workouts")
            .document(id)
            .delete()
    }
}
