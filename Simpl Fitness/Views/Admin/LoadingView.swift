//
//  LoadingView.swift
//  Simpl Fitness
//
//  Created by Collin Holthaus on 7/19/23.
//

import SwiftUI

struct LoadingView: View {
    init(){
        UITableView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        ZStack{
            Color("OxfordBlue")
                .ignoresSafeArea()
            VStack{
                //SF Logo
                Image("SF Logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            .scrollContentBackground(.hidden)
            .foregroundColor(Color("CadetGrey"))
            .background(Color("OxfordBlue"))
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
