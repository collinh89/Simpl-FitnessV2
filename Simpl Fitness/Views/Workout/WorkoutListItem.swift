//
//  WorkoutListItem.swift
//  Simpl Fitness
//
//  Created by Collin Holthaus on 6/11/23.
//

import SwiftUI
import SwiftUIReorderableForEach
import FirebaseFirestoreSwift

struct WorkoutListItem: View {
    @FirestoreQuery var exercises: [Exercise]
    @StateObject var viewModel = WorkoutListItemViewModel()
    @State private var allowReordering = false
    var workout: Workout
    var userId: String
    
    init(userId: String, workout: Workout) {
        self._exercises = FirestoreQuery(collectionPath: "users/\(userId)/workouts/\(workout.id)/exercises")
        self.workout = workout
        self.userId = userId
    }
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color("CadetGrey")
                    .ignoresSafeArea()
                VStack{
                    ScrollView{

                        ForEach(exercises) {exercise in
                            ExerciseCard(exercise: exercise, fromWorkoutList: true)
                        }
                    }
                    Spacer()
                }
                .toolbar{
                        Text(workout.name)
                            .font(.system(size: 30, weight: .bold))
                            .foregroundColor(.white)
                        Spacer()
                        NavigationLink(destination: AddOrRemoveExerciseView(userId: userId, workoutId: workout.id), label: {
                            Image(systemName: "square.and.pencil")
                                .foregroundColor(.white)
                        })
                    }
                .toolbarBackground(Color("CadetGrey"), for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
            }
        }
    }
}

struct WorkoutListItem_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutListItem(userId: "cV7tqRdfbYb60rg5vFSrgDb47iG2", workout: Workout(id: "123", name: "Test Workout",  createdDate: Date().timeIntervalSince1970))
    }
}
