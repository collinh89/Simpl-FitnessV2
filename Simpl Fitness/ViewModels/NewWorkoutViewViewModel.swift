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
    private var userId = ""
    @Published var name = ""
    @Published var category = ""
    @Published var exercises: [Exercise] = []
    @Published var showAlert = false
    
    init(){
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        self.userId = uId
    }
}
