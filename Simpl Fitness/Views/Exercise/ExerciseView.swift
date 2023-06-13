//
//  ExerciseView.swift
//  Simpl Fitness
//
//  Created by Collin Holthaus on 6/11/23.
//
import FirebaseFirestoreSwift
import SwiftUI

struct ExerciseView: View {
    @StateObject var viewModel: ExerciseViewViewModel
    @FirestoreQuery var items: [Exercise]
    
    init(userId: String){
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/exercises")
        self._viewModel = StateObject(wrappedValue: ExerciseViewViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView{
            VStack{
                List(items){ item in
                    ExerciseCard(exercise: item)
                        .swipeActions{
                            Button("Delete"){
                                //action here
                                viewModel.delete(id: item.id)
                            }
                            .tint(Color.red)
                        }
                        .listRowBackground(Color(.white))
                        .listRowSeparator(.hidden)
                }
                .navigationTitle("Exercises")
                .listStyle(InsetListStyle())
                .sheet(isPresented: $viewModel.showingNewItemView){
                    NewExerciseView(newItemPresented: $viewModel.showingNewItemView)
                }
                Spacer()
            }
            .toolbar{
                Button{
                    //action
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
    
    
    struct ExerciseView_Previews: PreviewProvider {
        static var previews: some View {
            ExerciseView(userId: "cV7tqRdfbYb60rg5vFSrgDb47iG2")
        }
    }
}
