//
//  WorkoutListItem.swift
//  Simpl Fitness
//
//  Created by Collin Holthaus on 6/11/23.
//

import SwiftUI

struct WorkoutListItem: View {
    
    var workout: Workout
    
    var body: some View {
        NavigationView{
            VStack{
                Text(workout.name)
                    .font(.system(size: 40))
                    .bold()
                ForEach(workout.exercises){ exercise in
                    ExerciseCard(exercise: exercise)
                }
                Spacer()
            }
        }
    }
}

struct WorkoutListItem_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutListItem(workout: Workout(id: "123", name: "Test Workout",category: "Chest", exercises: [], createdDate: Date().timeIntervalSince1970))
    }
}
