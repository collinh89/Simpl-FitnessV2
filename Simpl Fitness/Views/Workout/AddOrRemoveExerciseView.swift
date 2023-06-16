//
//  AddOrRemoveExerciseView.swift
//  Simpl Fitness
//
//  Created by Collin Holthaus on 6/15/23.
//

import SwiftUI

struct AddOrRemoveExerciseView: View {
    @StateObject var viewModel = AddOrRemoveExerciseViewViewModel()
    
    var workout: Workout
    
    var body: some View {
            VStack(alignment: .center){
                ScrollView{
                    Text("Current Exercises")
                        .font(.system(size: 36, weight: .bold))
                        .foregroundColor(Color("OxfordBlue"))
                    ForEach(workout.exercises) { exercise in
                        ZStack {
                            RoundedRectangle(cornerRadius: 25, style: .continuous)
                                .fill(Color("OxfordBlue"))
                            
                            HStack {
                                Text(exercise.name)
                                    .font(.system(size: 20, weight: .bold))
                                    .foregroundColor(.white)
                                    .padding()
                                Spacer()
                                Button{
                                    viewModel.delete(workout: workout, exerciseRemoved: exercise)
                                }label: {
                                    Image(systemName: "xmark")
                                }
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(.white)
                                .padding()
     
                            }
                        }
                        .frame(width: 400, height: 100)
                    }
                    
                    Text("All Exercises")
                        .font(.system(size: 36, weight: .bold))
                        .foregroundColor(Color("OxfordBlue"))
                    ForEach(viewModel.allExercises.sorted {
                        $0.category < $1.category
                    }) { exercise in
                        ZStack {
                            RoundedRectangle(cornerRadius: 25, style: .continuous)
                                .fill(Color("OxfordBlue"))
                            
                            HStack {
                                Text(exercise.name)
                                    .font(.system(size: 20, weight: .bold))
                                    .foregroundColor(.white)
                                    .padding()
                                Spacer()
                                Button{
                                    viewModel.addExercisesToWorkout(workout: workout, exerciseToAdd: exercise)
                                }label: {
                                    Image(systemName: "plus.circle")
                                }
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(.white)
                                .padding()
     
                            }
                        }
                        .frame(width: 400, height: 100)
                    }
                }
            }
            .onAppear{
                viewModel.getAllExercises()
            }
        }
}

struct AddOrRemoveExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        AddOrRemoveExerciseView(workout: Workout(id: "123", name: "Test Workout", category: "Test", exercises: [], createdDate: Date().timeIntervalSince1970))
    }
}
