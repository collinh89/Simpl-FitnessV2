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
            ZStack{
                VStack{
                    ScrollView{
                        Text("Exercises")
                            .font(.system(size: 36, weight: .bold))
                            .foregroundColor(.white)
                        ForEach(viewModel.categories.sorted(), id: \.self){ item in
                            Section(){
                                Text(item)
                                    .frame(maxWidth: .infinity , alignment: .leading)
                                    .font(.system(size: 26, weight: .bold))
                                    .foregroundColor(.white)
                                    .padding()
                                
                                ForEach(items.filter{$0.category == item}){ item in
                                    ExerciseCard(exercise: item)
                                        .swipeActions{
                                            Button("Delete"){
                                                //action here
                                                viewModel.delete(id: item.id)
                                            }
                                            .tint(Color.red)
                                        }
                                        .listRowSeparator(.hidden)
                                }
                            }
                            .listStyle(InsetListStyle())
                            .sheet(isPresented: $viewModel.showingNewItemView){
                                NewExerciseView(newItemPresented: $viewModel.showingNewItemView)
                            }
                            Spacer()
                        }
                    }
                }
                .toolbar{
                    Button{
                        //action
                        viewModel.showingNewItemView = true
                    } label: {
                        Image(systemName: "plus")
                            .foregroundColor(Color("LightCyan"))
                    }
                }
            }
            .toolbarBackground(Color("CGrey"), for: .navigationBar)
            .background(Color("CGrey"))
        }.onAppear{
            viewModel.getCategories(exercises: items)
        }
    }
    
    
    struct ExerciseView_Previews: PreviewProvider {
        static var previews: some View {
            ExerciseView(userId: "cV7tqRdfbYb60rg5vFSrgDb47iG2")
        }
    }
}
