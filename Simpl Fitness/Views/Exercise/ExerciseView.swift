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
    @FirestoreQuery var exercises: [Exercise]
    init(userId: String){
        self._exercises = FirestoreQuery(collectionPath: "users/\(userId)/exercises")
        self._viewModel = StateObject(wrappedValue: ExerciseViewViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView{
            ZStack{
                Color("CadetGrey")
                    .ignoresSafeArea()
                VStack{
                    ScrollView{
                        Text("Exercises")
                            .font(.system(size: 36, weight: .bold))
                            .foregroundColor(Color("OxfordBlue"))
                        
                        ForEach(exercises.map{$0.category}, id: \.self){ item in
                            Section(){
                                Text(item)
                                    .frame(maxWidth: .infinity , alignment: .leading)
                                    .font(.system(size: 26, weight: .bold))
                                    .foregroundColor(.white)
                                    .padding()
                                
                                ForEach(exercises.filter{$0.category == item}){ item in
                                    ExerciseCard(exercise: item)
                                        .swipeActions(edge: .trailing){
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
            .toolbarBackground(Color("CadetGrey"), for: .navigationBar)
            .background(Color("CadetGrey"))
        }
        .sheet(isPresented: $viewModel.showingNewItemView){
            NewExerciseView(newItemPresented: $viewModel.showingNewItemView)
                .onDisappear{
                    viewModel.getExercises()
                }
        }
        .onAppear{
            viewModel.getExercises()
        }
    }
    
    
    struct ExerciseView_Previews: PreviewProvider {
        static var previews: some View {
            ExerciseView(userId: "eNVQVVMOINhyq3EFLTvMCiCz1aY2")
        }
    }
}
