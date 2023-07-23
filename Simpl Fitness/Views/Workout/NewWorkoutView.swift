//
//  NewWorkoutView.swift
//  Simpl Fitness
//
//  Created by Collin Holthaus on 6/11/23.
//
import FirebaseFirestoreSwift
import SwiftUI

struct NewWorkoutView: View {
    @Environment(\.presentationMode) var presentationMode

    @State private var readyToNavigate : Bool = false
    @StateObject var viewModel: NewWorkoutViewViewModel
    @FirestoreQuery var exercises: [Exercise]
    var userId: String
    var selectedExercerises: [Exercise]
    
    init(userId: String){
        self._exercises = FirestoreQuery(collectionPath: "users/\(userId)/exercises")
        self._viewModel = StateObject(wrappedValue: NewWorkoutViewViewModel())
        self.userId = userId
        self.selectedExercerises = []
        
        UITableView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        NavigationStack{
            VStack{
                //SF Logo
                Image("SF Logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Form {
                    Section{
                        //Name
                        TextField("Give your new workout a name", text: $viewModel.name)
                            .textFieldStyle(DefaultTextFieldStyle())
                    } header: {
                        HStack(alignment: .center){
                            Spacer()
                            Text("Workout Details")
                                .font(.system(size: 15))
                            Spacer()
                        }
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                        ToolbarItem(placement: .principal) {
                            VStack{
                                HStack{
                                    Button{
                                        //action
                                        presentationMode.wrappedValue.dismiss()

                                    } label: {
                                        Text("Back")
                                    }
                                    Spacer()
                                }
                                .padding(.top, 40)
                                
                                Text("New Workout")
                                    .foregroundColor(Color("LightBlue"))
                                    .font(.system(size: 40))
                                    .bold()
                                    .padding(.top, 10)
                        }
                    }
                }
                .padding(.top, 40)
                
                Button {
                    viewModel.saveWorkout()
                    readyToNavigate = true
                } label: {
                    Text("Select Exercises")
                }
                .navigationDestination(isPresented: $readyToNavigate) {
                    AddOrRemoveExerciseView(userId: userId, workoutId: viewModel.workoutId)
                }
                .frame(maxWidth: 300, alignment: .center).padding()
                .foregroundColor(Color("OxfordBlue"))
                .background(Color("LightBlue")).cornerRadius(5)
                
                Spacer()
            }
            .scrollContentBackground(.hidden)
            .foregroundColor(Color("CadetGrey"))
            .background(Color("OxfordBlue"))
        }
        .navigationBarBackButtonHidden(true)
        
    }
}

struct NewWorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        NewWorkoutView(userId: "cV7tqRdfbYb60rg5vFSrgDb47iG2")
    }
}
