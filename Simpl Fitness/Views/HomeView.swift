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
    @FirestoreQuery var exercises: [Exercise]
    
    init(userId: String){
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/workouts")
        self._exercises = FirestoreQuery(collectionPath: "users/\(userId)/exercises")
        self._viewModel = StateObject(wrappedValue: HomeViewViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView{
            VStack{
                List(items){ item in
                    NavigationLink(destination: WorkoutListItem(workout: item), label: {
                        Text(item.name)
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
                }
                .navigationTitle("Workouts")
                .toolbar{
                    Button{
                        //action
                        viewModel.showingNewItemView = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                .sheet(isPresented: $viewModel.showingNewItemView){
                    NewWorkoutView(newItemPresented: $viewModel.showingNewItemView, exercises: exercises)
                }
                
            }
            .background(Color(.lightGray))
        }
    }
    
    struct HomeView_Previews: PreviewProvider {
        static var previews: some View {
            HomeView(userId: "cV7tqRdfbYb60rg5vFSrgDb47iG2")
        }
    }
}
