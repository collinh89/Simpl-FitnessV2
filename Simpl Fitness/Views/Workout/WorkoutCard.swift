//
//  WorkoutCard.swift
//  Simpl Fitness
//
//  Created by Collin Holthaus on 7/23/23.
//

import SwiftUI

struct WorkoutCard: View {
    var workout: Workout

    var body: some View {
        VStack(alignment: .center){
                Text(workout.name)
                    .font(.system(size: 26, weight: .bold, design: .default))
                    .foregroundColor(Color(.white))
                    .padding()
        }
        .transition(.move(edge: .bottom))
        .frame(width: 175, height: 200)
        .background(
            LinearGradient(gradient: Gradient(colors: [Color("LightCyan"), Color("OxfordBlue")]), startPoint: .top, endPoint: .bottom)
        )
        .cornerRadius(10) /// make the background rounded
        .overlay( /// apply a rounded border
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color("CadetGrey"), lineWidth: 2)
        )
        
    }
}

struct WorkoutCard_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutCard(workout: Workout(id: "74039498-E726-49F3-BDD1-0088BE6EEEAB", name: "Test workout", createdDate: 1689195801.172672))
    }
}
