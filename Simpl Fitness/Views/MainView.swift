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
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty{
            //signed in
            accountView
        
        }else{
            LoginView()
        }
    }
    
    @ViewBuilder
    var accountView: some View {
        TabView{
            Group{
                HomeView(userId: viewModel.currentUserId)
                    .tabItem{
                        Label("Workouts", systemImage: "scalemass")
                    }
                ExerciseView(userId: viewModel.currentUserId)
                    .tabItem{
                        Label("Exercises", systemImage: "figure.strengthtraining.traditional")
                    }
                ProfileView()
                    .tabItem{
                        Label("Profile", systemImage: "person.circle")
                    }
            }
            .toolbarBackground(.visible, for: .tabBar)
            .toolbarBackground(Color("OxfordBlue"), for: .tabBar)
            .toolbarColorScheme(.dark, for: .tabBar)

        }
    }
}
