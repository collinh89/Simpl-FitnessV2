//
//  LoginViewViewModel.swift
//  Simpl Fitness
//
//  Created by Collin Holthaus on 6/8/23.
//

import FirebaseAuth
import Foundation

class LoginViewViewModel: ObservableObject{
    @Published var email = ""
    @Published var password = ""
    @Published var errorMsg = ""
    
    init(){
        
    }
    func login(){
        guard validate() else{
            return
        }
        
        //Try log in
        Auth.auth().signIn(withEmail: email, password: password)
    }
    private func validate() -> Bool {
        errorMsg = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty, !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMsg = "Please fill in all fields."
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            errorMsg = "Please enter valid Email."
            return false
        }
        return true
    }
}
