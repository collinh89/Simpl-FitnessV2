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
                        .padding()
                }
            Text("Workouts")
                .tabItem {
                    Image(systemName: "dumbbell.fill")
                }
            Text("Exercsises")
                .tabItem {
                    Image( systemName: "figure.run")
                }
            Text("Profile")
                .tabItem {
                    Image( systemName: "person.crop.circle.fill")
                    
                }
        }//end of tabView
        .tint(Color("LightBlue"))
        .onAppear(){
            UITabBar.appearance().backgroundColor = UIColor(Color("ToolBarBackground"))
            UITabBar.appearance().unselectedItemTintColor = .white
        }
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

