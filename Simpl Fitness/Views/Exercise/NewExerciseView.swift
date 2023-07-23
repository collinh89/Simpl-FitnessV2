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
    @State private var categoriesSection1 = [
        "Abs",
        "Chest",
        "Legs",
        "Shoulders"
    ]
    @State private var categoriesSection2 = [
        "Tricepts",
        "Bicepts",
        "Forearms",
        "Back"
    ]

    var body: some View {
        NavigationStack{
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
                        Text("Select Category")
                        Picker("\(selection)", selection: $selection) {
                            ForEach(categoriesSection1, id: \.self) {
                                Text($0)
                            }
                        }
                        .labelsHidden()
                        .pickerStyle(SegmentedPickerStyle())
                        Picker("\(selection)", selection: $selection) {
                            ForEach(categoriesSection2, id: \.self) {
                                Text($0)
                            }
                        }
                        .labelsHidden()
                        .pickerStyle(SegmentedPickerStyle())

                    }

                    //Weight
                    TextField("Weight", text: $viewModel.weight)
                        .textFieldStyle(DefaultTextFieldStyle())

                    //Sets
                    TextField("Sets", text: $viewModel.sets)
                        .textFieldStyle(DefaultTextFieldStyle())

                    //Reps
                    TextField("Reps", text: $viewModel.reps)
                        .textFieldStyle(DefaultTextFieldStyle())
                }
                .alert(isPresented: $viewModel.showAlert){
                    Alert(title: Text("Error"), message: Text("Please fill in all field and select a due date"))
                }
                
                //button
                Button{
                    //action
                    viewModel.category = selection
                    viewModel.saveExercise()
                    newItemPresented = false
                } label: {
                    Text("Save")
                }
                .frame(maxWidth: 300, alignment: .center).padding()
                .foregroundColor(Color("OxfordBlue"))
                .background(Color("LightBlue")).cornerRadius(5)
                .padding(.bottom, 50)
                
        }
            .scrollContentBackground(.hidden)
            .foregroundColor(Color("CadetGrey"))
            .background(Color("OxfordBlue"))
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
