//
//  ContentView.swift
//  Simpl Fitness
//
//  Created by Collin Holthaus on 6/8/23.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        TabView {
                HomeView()
                    .tabItem {
                        Image(systemName: "house.fill")
                            .foregroundColor(.white)
                            .padding()
                    }
                    .toolbar(.visible, for: .tabBar)
                    .toolbarBackground(Color("ToolBarBackground"), for: .tabBar)
                Text("Workouts")
                    .tabItem {
                        Image(systemName: "dumbbell.fill")
                            .foregroundColor(.white)
                    }
                    .toolbar(.visible, for: .tabBar)
                    .toolbarBackground(Color("ToolBarBackground"), for: .tabBar)
                Text("Exercsises")
                    .tabItem {
                        Image( systemName: "figure.run")
                    }
                    .toolbar(.visible, for: .tabBar)
                    .toolbarBackground(Color("ToolBarBackground"), for: .tabBar)
                Text("Profile")
                    .tabItem {
                        Image( systemName: "person.crop.circle.fill")
                    }
                    .toolbar(.visible, for: .tabBar)
                    .toolbarBackground(Color("ToolBarBackground"), for: .tabBar)

        }//end of tabView
        .tint(Color("LightBlue"))
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

