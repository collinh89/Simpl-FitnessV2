//
//  SimplFitnessBtn.swift
//  Simpl FitnessV2
//
//  Created by Collin Holthaus on 10/25/23.
//

import SwiftUI

struct SimplFitnessBtn: View {
    var text: String
    var width: CGFloat
    var height: CGFloat


    var clicked: (() -> Void)

    var body: some View {
        Button(action: clicked){
            HStack {
                Text(text) /// your text
                    .font(.system(size: 20, weight: .semibold))
            }
            .frame(width: width, height: height)
            .foregroundColor(Color.black)
            .padding()
            .background(Color("ButtonBackgroundColor"))
            .cornerRadius(16)
        }
    }
}

struct SimplFitnessBtn_Previews: PreviewProvider {
    static var handler : () -> Void = {  };
    
    static var previews: some View {
        SimplFitnessBtn(text: "Test Button",width: 200,height: 25, clicked: handler)
    }
}
