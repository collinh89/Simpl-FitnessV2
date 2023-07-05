//
//  ExerciseSelectionView.swift
//  Simpl Fitness
//
//  Created by Collin Holthaus on 6/11/23.
//

import FirebaseFirestoreSwift
import SwiftUI

struct ExerciseSelectionView: View {
    @StateObject var viewModel = ExerciseSelectionViewViewModel()
    @State var selectedRows = Set<Exercise>()
    @Binding var newItemPresented: Bool
    
    var workoutName = ""
    var category = ""
    var exercises: [Exercise]
    
    var body: some View {
        NavigationView{
            VStack{
                List(selection: $selectedRows) {
                    ForEach(exercises.sorted {
                        $0.category < $1.category
                    }, id: \.id){ exercise in
                        HStack{
                            VStack{
                                Text(exercise.category)
                                    .listRowBackground(Color(.lightGray))
                                ExerciseCard(exercise: exercise, fromWorkoutList: false, onSelectionPage: true)
                                
                            }
                            
                            Spacer()
                            Button{
                                selectedRows.insert(exercise)
                            }label: {
                                Text(Image(systemName: "plus.circle"))
                            }
                        }
                        .listRowBackground(Color(.lightGray))
                        
                    }
                }
                .listRowSeparator(.hidden)
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
            
        }), workoutName: "Test Workout", category: "Chest", exercises: [])
    }
}
