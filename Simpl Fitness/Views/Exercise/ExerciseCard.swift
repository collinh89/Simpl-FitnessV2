//
//  ExerciseCard.swift
//  Simpl Fitness
//
//  Created by Collin Holthaus on 6/11/23.
//

import SwiftUI

struct ExerciseCard: View {
    var exercise: Exercise
    
    var body: some View {
            VStack(alignment: .center){
                    Text(exercise.name)
                        .font(.system(size: 26, weight: .bold, design: .default))
                        .foregroundColor(.white)
                        .padding()
                
                HStack{
                    VStack{
                        Text("Weight")
                            .font(.system(size: 20, weight: .bold, design: .default))
                            .foregroundColor(.white)
                        Text("\(String(exercise.weight)) lbs")
                            .font(.system(size: 17, weight: .light, design: .default))
                            .foregroundColor(.white)
                    }
                    .padding(.leading)
                    .padding(.trailing)

                    VStack{
                        Text("Reps")
                            .font(.system(size: 20, weight: .bold, design: .default))
                            .foregroundColor(.white)
                        Text(exercise.reps)
                            .font(.system(size: 17, weight: .light, design: .default))
                            .foregroundColor(.white)
                    }
                    .padding(.leading)
                    .padding(.trailing)
                    
                    VStack{
                        Text("Sets")
                            .font(.system(size: 20, weight: .bold, design: .default))
                            .foregroundColor(.white)
                        Text(exercise.sets)
                            .font(.system(size: 17, weight: .light, design: .default))
                            .foregroundColor(.white)
                    }
                    .padding(.leading)
                    .padding(.trailing)
                }
                
                .padding(.bottom)
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .background(Color("MyBlue"))
            .modifier(CardModifier())
            .padding(.all, 10)
        }
    }

struct CardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 0)
    }
    
}
struct ExerciseCard_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseCard(exercise: Exercise(id: "123", name: "Dumbbell Bench Press", weight: 50, sets: "2", reps: "8", category: "Chest"))
    }
}
