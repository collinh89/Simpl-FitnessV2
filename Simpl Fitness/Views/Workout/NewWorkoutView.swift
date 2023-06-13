//
//  NewWorkoutView.swift
//  Simpl Fitness
//
//  Created by Collin Holthaus on 6/11/23.
//
import FirebaseFirestoreSwift
import SwiftUI

struct NewWorkoutView: View {
    @StateObject var viewModel = NewWorkoutViewViewModel()
    @Binding var newItemPresented: Bool
    var exercises: [Exercise]


    var body: some View {
        NavigationView{
            VStack{
                Text("New Workout")
                    .font(.system(size: 32))
                    .bold()
                    .padding(.top,50)
                
                Form {
                    //Name
                    TextField("Give your new workout a name", text: $viewModel.name)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    //Category
                    TextField("Give your new workout a category", text: $viewModel.category)
                        .textFieldStyle(DefaultTextFieldStyle())

                    //Button
                    NavigationLink("Select Exercises",destination: ExerciseSelectionView(newItemPresented: $newItemPresented,workoutName: viewModel.name, category: viewModel.category, exercises: exercises))
                }
                .alert(isPresented: $viewModel.showAlert){
                    Alert(title: Text("Error"), message: Text("Please fill in all field and select a due date"))
                }
        }
        }
    }
}

struct NewWorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        NewWorkoutView(newItemPresented:  Binding(get: {
            return true
        }, set: {_ in
             
        }), exercises: [])
    }
}
