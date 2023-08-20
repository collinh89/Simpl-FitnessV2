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
    @State private var categories1 = [
        "Abs",
        "Chest",
        "Legs",
        "Shoulders"
    ]
    @State private var categories2 = [
        "Tricepts",
        "Bicepts",
        "Forearms",
        "Back"
    ]
    @State private var selection: String = ""
    var exercise: Exercise
    
    var body: some View {
        VStack{
            Text("Update \(exercise.name)")
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
                    Picker("\(viewModel.category)", selection: $selection) {
                        ForEach(categories1, id: \.self) {
                            Text($0)
                        }
                    }
                    .labelsHidden()
                    .pickerStyle(SegmentedPickerStyle())
                    .onChange(of: selection){ category in
                        viewModel.category = category
                    }
                    Picker("\(viewModel.category)", selection: $selection) {
                        ForEach(categories2, id: \.self) {
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
                          //button
                          Button{
                    //action
                    viewModel.updateExercise()
                    presentationMode.wrappedValue.dismiss()
                    
                } label: {
                    Text("Update")
                }
                    .frame(maxWidth: 300, alignment: .center).padding()
                    .foregroundColor(Color("OxfordBlue"))
                    .background(Color("LightBlue")).cornerRadius(5)
                    .padding(.bottom, 50)
                          }
                    .scrollContentBackground(.hidden)
                    .foregroundColor(Color("CadetGrey"))
                    .background(Color("OxfordBlue"))
                    .onAppear{
                        viewModel.setExercise(exercise: exercise)
                        selection = viewModel.category
                    }
                          }
                          }
                          
                          struct EditExerciseView_Previews: PreviewProvider {
                    static var previews: some View {
                        EditExerciseView(exercise: Exercise(id: "123", name: "Test", weight: "50", sets: "3", reps: "10", category: "Back"))
                    }
                }
