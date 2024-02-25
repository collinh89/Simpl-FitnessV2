//
//  RecentWorkoutsHomeView.swift
//  Simpl FitnessV2
//
//  Created by Collin Holthaus on 10/25/23.
//

import SwiftUI

struct PopularWorkoutsHomeView: View {
    var body: some View {
        VStack{
            HStack{
                Text("Popular Workouts")
                    .foregroundColor(.white)
                    .font(.system(size: 25, weight: .bold))
                
                Spacer()
            }
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(0..<5) {_ in
                        VStack{
                            Image("DeafultWorkoutImg")
                                .resizable()
                                .frame(width: 350, height: 250)
                                .offset(y: -55)
                            HStack{
                                Text("Mondays Back and Bicepts")
                                    .foregroundStyle(.white)
                                    .font(.title)
                                    .padding(.leading, 30)
                                    .offset(y: -55)
                                Spacer()
                            }
                            HStack{
                                Text("Created By Collin Holthaus")
                                    .foregroundStyle(.white)
                                    .font(.title3)
                                    .padding(.leading, 30)
                                    .offset(y: -55)
                                Spacer()
                            }
                        }
                            .frame(width: 350, height:250)
                            .background(Color.black)
                            .cornerRadius(16)
                    }
                }
            }
        }
    }
}

struct PopularWorkoutsHomeView_Previews: PreviewProvider {
    static var previews: some View {
        PopularWorkoutsHomeView()
    }
}
