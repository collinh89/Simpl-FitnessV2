//
//  AddOrRemoveExerciseView.swift
//  Simpl Fitness
//
//  Created by Collin Holthaus on 6/15/23.
//

import SwiftUI
import FirebaseFirestoreSwift
import SwiftUIReorderableForEach

struct AddOrRemoveExerciseView: View {
    @State private var readyToNavigate : Bool = false
    @StateObject var viewModel: AddOrRemoveExerciseViewViewModel
    @FirestoreQuery var exercises: [Exercise]
    var workoutId: String
    var userId: String
    
    init(userId: String, workoutId: String){
        self._exercises = FirestoreQuery(collectionPath: "users/\(userId)/workouts/\(workoutId)/exercises")
        self._viewModel = StateObject(wrappedValue: AddOrRemoveExerciseViewViewModel())
        self.workoutId = workoutId
        self.userId = userId
    }
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color("CadetGrey")
                    .ignoresSafeArea()
                VStack(alignment: .center){
                    ScrollView{
                        Text("Current Exercises")
                            .font(.system(size: 36, weight: .bold))
                            .foregroundColor(Color("OxfordBlue"))
                        if(exercises.count == 0){
                            Text("No Exercises Selected")
                        }
                        ForEach(exercises) { exercise in
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
                                        viewModel.delete(workoutId: workoutId, exerciseRemoved: exercise)
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
                        ForEach(viewModel.categories.sorted(), id: \.self){ category in
                            Section(){
                                Text(category)
                                ForEach(viewModel.allExercises.filter{$0.category == category}) { exercise in
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
                                                viewModel.addExercisesToWorkout(workoutId: workoutId, exerciseToAdd: exercise)
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
                    }
                }
                .toolbar {
                    Button {
                        readyToNavigate = true
                    } label: {
                        Text("Save Exercises")
                    }
                    .navigationDestination(isPresented: $readyToNavigate) {
                        HomeView(userId: userId)
                    }
                }
            }
            
        }
    }
}

struct AddOrRemoveExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        AddOrRemoveExerciseView(userId: "cV7tqRdfbYb60rg5vFSrgDb47iG2", workoutId: "123")
    }
}
