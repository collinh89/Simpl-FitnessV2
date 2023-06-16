//
//  NewExerciseView.swift
//  Simpl Fitness
//
//  Created by Collin Holthaus on 6/11/23.
//

import SwiftUI

struct NewExerciseView: View {
    @StateObject var viewModel = NewExerciseViewViewModel()
    @Binding var newItemPresented: Bool
    @State private var selection = "Abs"
    @State private var categories = [
        "Abs",
        "Chest",
        "Legs",
        "Shoulders",
        "Tricepts",
        "Bicepts",
        "Back"
    ]

    var body: some View {
        NavigationView{
            VStack{
                Text("New Exercise")
                    .font(.system(size: 32))
                    .bold()
                    .padding(.top,50)
                
                Form {
                    //Name
                    TextField("Give your new exercise a name", text: $viewModel.name)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    //Category
                    VStack{
                        Picker("\(selection)", selection: $selection) {
                            ForEach(categories, id: \.self) {
                                Text($0)
                            }
                        }
                        .labelsHidden()
                        .pickerStyle(MenuPickerStyle())
                        
                    }

//                    TextField("Category", text: $viewModel.category)
//                        .textFieldStyle(DefaultTextFieldStyle())

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
                        viewModel.category = selection
                        viewModel.saveExercise()
                        newItemPresented = false
                    } label: {
                        Text("Save")
                    }
                    
                }
                .alert(isPresented: $viewModel.showAlert){
                    Alert(title: Text("Error"), message: Text("Please fill in all field and select a due date"))
                }
        }
        }
    }
}

struct NewExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        NewExerciseView(newItemPresented:  Binding(get: {
            return true
        }, set: {_ in
             
        }))
    }
}
