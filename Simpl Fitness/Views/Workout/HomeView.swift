//
//  HomeView.swift
//  Simpl Fitness
//
//  Created by Collin Holthaus on 6/8/23.
//

import FirebaseFirestoreSwift
import SwiftUI

struct HomeView: View {
    @StateObject var viewModel: HomeViewViewModel
    @FirestoreQuery var items: [Workout]
    var userId: String
    
    init(userId: String){
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/workouts")
        self._viewModel = StateObject(wrappedValue: HomeViewViewModel(userId: userId))
        self.userId = userId
    }
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color("CadetGrey")
                    .ignoresSafeArea()
                VStack{
                    Text("Workouts")
                        .font(.system(size: 36, weight: .bold))
                        .foregroundColor(Color("OxfordBlue"))
                    List(items){ item in
                        NavigationLink(destination: WorkoutListItem(userId: userId, workout: item), label: {
                            Text(item.name)
                                .foregroundColor(Color("OxfordBlue"))
                                .font(.system(size: 20))
                                .bold()
                                .padding()
                        })
                        .swipeActions{
                            Button("Delete"){
                                //action here
                                viewModel.delete(id: item.id)
                            }
                            .tint(Color.red)
                        }
                        .listRowBackground(Color("CadetGrey"))
                    }
                    .scrollContentBackground(.hidden)
                    .overlay(Group {
                        if(items.isEmpty) {
                            ZStack() {
                                Color("CadetGrey").ignoresSafeArea()
                                Text("No Workouts Created")
                            }
                        }
                    })
                    Spacer()
                }
                .scrollContentBackground(.hidden)
                .toolbar{
                    NavigationLink(destination: NewWorkoutView(userId: userId)){
                            Image(systemName: "plus")
                                .foregroundColor(Color("LightCyan"))
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    struct HomeView_Previews: PreviewProvider {
        static var previews: some View {
            HomeView(userId: "eNVQVVMOINhyq3EFLTvMCiCz1aY2")
        }
    }
}
