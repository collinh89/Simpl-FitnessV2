//
//  HomeView.swift
//  Simpl Fitness
//
//  Created by Collin Holthaus on 6/8/23.
//

import FirebaseFirestoreSwift
import SwiftUI

struct HomeView: View {
    @State private var readyToNavigate : Bool = false
    @State private var workoutIdTodelete : String = ""

    @StateObject var viewModel: HomeViewViewModel
    @FirestoreQuery var workouts: [Workout]
    @State var showingAlert: Bool = false
    var userId: String
    
    init(userId: String){
        self._workouts = FirestoreQuery(collectionPath: "users/\(userId)/workouts")
        self._viewModel = StateObject(wrappedValue: HomeViewViewModel(userId: userId))
        self.userId = userId
    }
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color("CadetGrey")
                    .ignoresSafeArea()
                VStack{
                    Text("Workouts")
                        .font(.system(size: 36, weight: .bold))
                        .foregroundColor(Color("OxfordBlue"))
                    
                    ScrollView{
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(workouts) { workout in
                                WorkoutCard(workout: workout)
                                    .onTapGesture {
                                        readyToNavigate = true
                                    }
                                    .navigationDestination(isPresented: $readyToNavigate) {
                                        WorkoutListItem(userId: userId, workout: workout)
                                    }
                                    .onLongPressGesture {
                                        showingAlert = true
                                        workoutIdTodelete = workout.id
                                    }
                            }
                            .padding(.horizontal)
                        }
                        Spacer()
                    }
                }
                .alert(isPresented: $showingAlert) { () -> Alert in
                                Alert(title: Text("Delete"), message: Text("Are you sure you want to delete this workout"), primaryButton: .default(Text("Delete"), action: {
                                    viewModel.delete(id: workoutIdTodelete)
                                }), secondaryButton: .default(Text("Dismiss")))
               
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
            HomeView(userId: "Kx4D0jj4HoV6e4mAlGQUoPl1Khe2")
        }
    }
}
