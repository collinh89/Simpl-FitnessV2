//
//  EditExerciseView.swift
//  Simpl Fitness
//
//  Created by Collin Holthaus on 6/12/23.
//

import FirebaseFirestoreSwift
import SwiftUI

struct EditExerciseView: View {
    @Environment(\.presentationMode) var presentationMode

    @State private var readyToNavigate : Bool = false
    @StateObject var viewModel = EditExerciseViewViewModel()
    @State var isExpanded = false

    var exercise: Exercise
    var body: some View {
        VStack{
            Text("Update \(exercise.name)")
                .font(.system(size: 25))
                .bold()
                .padding(.top,25)
        Form {
            //Name
            TextField("Give your new exercise a name", text: $viewModel.name)
                .textFieldStyle(DefaultTextFieldStyle())
            
            //Category
            TextField("Category", text: $viewModel.category)
                .textFieldStyle(DefaultTextFieldStyle())
            
            //Weight
            TextField("Weight", value: $viewModel.weight, formatter: NumberFormatter())
                .keyboardType(.numberPad)
                .textFieldStyle(DefaultTextFieldStyle())
            
            //Sets
            TextField("Sets", text: $viewModel.sets)
                .textFieldStyle(DefaultTextFieldStyle())
            
            //Reps
            TextField("Reps", text: $viewModel.reps)
                .textFieldStyle(DefaultTextFieldStyle())
            
            //button
            Button{
                //action
                viewModel.updateExercise()
                presentationMode.wrappedValue.dismiss()

            } label: {
                Text("Update")
            }
        }
    }
        .onAppear{
            viewModel.setExercise(exercise: exercise)
            viewModel.getWorkouts()
        }
    }
}

struct EditExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        EditExerciseView(exercise: Exercise(id: "123", name: "Test", weight: 50, sets: "3", reps: "10", category: "Chest"))
    }
}
