//
//  ExerciseSelectionView.swift
//  Simpl Fitness
//
//  Created by Collin Holthaus on 6/11/23.
//

import SwiftUI

struct ExerciseSelectionView: View {
    @StateObject var viewModel = ExerciseSelectionViewViewModel()
    @State var selectedRows = Set<Exercise>()
    @Binding var newItemPresented: Bool

    var workoutName = ""
    var category = ""
    
    var body: some View {
        NavigationView{
            VStack{
                List(selection: $selectedRows) {
                    ForEach(viewModel.getExercises(), id: \.id){ exercise in
                        HStack{
                            Text(exercise.name)
                            Spacer()
                            Button{
                                selectedRows.insert(exercise)
                            }label: {
                                Text(Image(systemName: "plus.circle"))
                            }
                        }
                    }
                }
                .navigationTitle("Select Exercises \(selectedRows.count)")
                Button{
                    //action
                    viewModel.saveWorkout(exercises: selectedRows, workoutName: workoutName, category: category)
                    newItemPresented = false
                }label: {
                    Text("Save")
                }
            }
        }
    }
}

struct ExerciseSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseSelectionView(newItemPresented:  Binding(get: {
            return true
        }, set: {_ in
            
        }), workoutName: "Test Workout", category: "Chest")
    }
}
