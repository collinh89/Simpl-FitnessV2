//
//  MainViewViewModel.swift
//  Simpl Fitness
//
//  Created by Collin Holthaus on 6/8/23.
//

import FirebaseAuth
import Foundation

class MainViewViewModel:ObservableObject {
    @Published var currentUserId: String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
    init(){
//        do{
//            try Auth.auth().signOut()
//        }catch{
//            print(error)
//        }
        self.handler = Auth.auth().addStateDidChangeListener {[weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
            }
        }
    }
    
    public var isSignedIn: Bool{
        return Auth.auth().currentUser != nil
    }
}
