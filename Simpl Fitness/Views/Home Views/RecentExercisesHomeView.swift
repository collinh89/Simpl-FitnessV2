//
//  RecentExercisesHomeView.swift
//  Simpl FitnessV2
//
//  Created by Collin Holthaus on 10/25/23.
//

import SwiftUI

struct RecentExercisesHomeView: View {
    var body: some View {
        VStack{
            HStack{
                Text("Recently Created Exercises")
                    .foregroundColor(.white)
                    .font(.system(size: 25, weight: .bold))
                
                Spacer()
            }
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(0..<5) {
                        Text("Item \($0)")
                            .foregroundStyle(.black)
                            .font(.largeTitle)
                            .frame(width: 200, height: 125)
                            .background(Color("ButtonBackgroundColor"))
                            .cornerRadius(16)
                    }
                }
            }
        }
    }
}

struct RecentExercisesHomeView_Previews: PreviewProvider {
    static var previews: some View {
        RecentExercisesHomeView()
    }
}
