//
//  HomeView.swift
//  Simpl Fitness
//
//  Created by Collin Holthaus on 6/8/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack{
            Color("BackgroundColor")
                .ignoresSafeArea()
            
            VStack{
                SimplFitnessBtn(
                    text: "Start Workout",
                    width: 300,
                    height: 75
                ) {
                    print("Clicked!")
                }
                .padding(.bottom, 50)
                .padding(.top, 50)
                RecentWorkoutsHomeView()
                    .padding(.bottom, 40)
                RecentExercisesHomeView()
                Spacer()
            }
        }
    }
    
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
