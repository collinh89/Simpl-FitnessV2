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
                ForEach(items){ item in
                    ExerciseCard(exercise: item)
                        .swipeActions{
                            Button("Delete"){
                                //action here
                                viewModel.delete(id: item.id)
                            }
                            .tint(Color.red)
                        }
                }
                .navigationTitle("Exercises")
                .toolbar{
                    Button{
                        //action
                        viewModel.showingNewItemView = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                .sheet(isPresented: $viewModel.showingNewItemView){
                    NewExerciseView(newItemPresented: $viewModel.showingNewItemView)
                }
                Spacer()
            }
            .background(Color(.lightGray))
        }
    }
    
    
    struct ExerciseView_Previews: PreviewProvider {
        static var previews: some View {
            ExerciseView(userId: "cV7tqRdfbYb60rg5vFSrgDb47iG2")
        }
    }
}
