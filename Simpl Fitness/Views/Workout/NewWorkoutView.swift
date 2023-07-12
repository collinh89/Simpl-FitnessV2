//
//  NewWorkoutView.swift
//  Simpl Fitness
//
//  Created by Collin Holthaus on 6/11/23.
//
import FirebaseFirestoreSwift
import SwiftUI

struct NewWorkoutView: View {
    @State private var readyToNavigate : Bool = false
    @StateObject var viewModel: NewWorkoutViewViewModel
    @FirestoreQuery var exercises: [Exercise]
    var userId: String
    var selectedExercerises: [Exercise]
    
    init(userId: String){
        self._exercises = FirestoreQuery(collectionPath: "users/\(userId)/exercises")
        self._viewModel = StateObject(wrappedValue: NewWorkoutViewViewModel())
        self.userId = userId
        self.selectedExercerises = []
        
        UITableView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        NavigationStack{
            VStack{
                Form {
                    Section{
                        //Name
                        TextField("Give your new workout a name", text: $viewModel.name)
                            .textFieldStyle(DefaultTextFieldStyle())
                    } header: {
                        Text("Workout Details")
                    }
                    
                    Section{
                        Button {
                            viewModel.saveWorkout()
                            readyToNavigate = true
                        } label: {
                            Text("Select Exercises")
                        }
                        .navigationDestination(isPresented: $readyToNavigate) {
                            AddOrRemoveExerciseView(userId: userId, workoutId: viewModel.workoutId)
                        }
                        
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                            Text("New Workout")
                                .foregroundColor(Color("OxfordBlue"))
                                .font(.system(size: 30))
                                .bold()
                    }
                }
                .padding(.top, 40)
            }
        }
        .navigationBarBackButtonHidden(true)

    }
}

struct NewWorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        NewWorkoutView(userId: "cV7tqRdfbYb60rg5vFSrgDb47iG2")
    }
}
