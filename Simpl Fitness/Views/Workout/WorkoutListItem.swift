//
//  WorkoutListItem.swift
//  Simpl Fitness
//
//  Created by Collin Holthaus on 6/11/23.
//

import SwiftUI
import SwiftUIReorderableForEach

struct WorkoutListItem: View {
    var workout: Workout
    @State private var isDone = false
    @State private var allowReordering = false
    @State private var exercises: [Exercise]
    
    init(workout: Workout, allowReordering: Bool = false, exercises: [Exercise]) {
        self.workout = workout
        self.allowReordering = allowReordering
        self.exercises = workout.exercises
    }
    
    var body: some View {
        NavigationView{
            VStack{
                ScrollView{
                    HStack{
                        Text(workout.name)
                            .font(.system(size: 36, weight: .bold))
                            .foregroundColor(.white)
                            .padding()
                        Spacer()
                        Toggle("Reorder", isOn: $allowReordering)
                          .tint(Color("LightCyan"))
                          .toggleStyle(SwitchToggleStyle())
                          .labelsHidden()
                    }
                    ReorderableForEach($exercises, allowReordering: $allowReordering){ exercise,isDragged  in
                        ExerciseCard(exercise: exercise, fromWorkoutList: true)
                    }
                    .onTapGesture {
                        isDone = !isDone
                    }
                }
                Spacer()
            }
            .background(Color("CGrey"))
        }
    }
}

struct WorkoutListItem_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutListItem(workout: Workout(id: "123", name: "Test Workout",category: "Chest", exercises: [], createdDate: Date().timeIntervalSince1970), exercises: [])
    }
}
