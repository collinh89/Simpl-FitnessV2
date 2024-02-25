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
            ScrollView {
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
                    PopularWorkoutsHomeView()
                        .padding(.leading,10)
                        .padding(.trailing, 10)
                        .padding(.bottom, 40)
                    RecentExercisesHomeView()
                        .padding(.leading,10)
                        .padding(.trailing, 10)
                        .padding(.bottom, 30)
                    
                    VStack{
                        HStack{
                            Text("Quick Actions")
                                .foregroundColor(.white)
                                .font(.system(size: 25, weight: .bold))
                            
                            Spacer()
                        }
                        
                        HStack{
                            SimplFitnessBtn(
                                text: "Create Workout",
                                width: 150,
                                height: 50
                            ) {
                                print("Clicked!")
                            }
                            SimplFitnessBtn(
                                text: "Create Exercise",
                                width: 150,
                                height: 50
                            ) {
                                print("Clicked!")
                            }
                        }
                    }
                    .padding(.leading,10)
                    .padding(.trailing, 10)
                    Spacer()
                }
            }
        }
    }
    
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
