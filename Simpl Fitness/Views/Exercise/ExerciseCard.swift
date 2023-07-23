//
//  ExerciseCard.swift
//  Simpl Fitness
//
//  Created by Collin Holthaus on 6/11/23.
//

import SwiftUI

struct ExerciseCard: View {
    var exercise: Exercise
    
    var fromWorkoutList = false
    var onSelectionPage = false
    @State var isExpanded = true
    @State private var isDone = false
    
    var body: some View {
        
        VStack(alignment: .center){
            HStack{
                if(fromWorkoutList == true){
                    Toggle("Done", isOn: $isDone)
                        .tint(isDone ? Color("OxfordBlue") : .white)
                        .toggleStyle(DefaultToggleStyle())
                        .labelsHidden()
                        .padding()
                        .onTapGesture {
                            withAnimation {
                                isExpanded.toggle()
                            }
                        }
                    Spacer()
                }
                Text(exercise.name)
                    .font(.system(size: 26, weight: .bold, design: .default))
                    .foregroundColor(isDone ? Color("CGrey") : .white)
                    .padding()
                Spacer()
                if(onSelectionPage != true){
                    NavigationLink(destination: EditExerciseView(exercise: exercise), label: {
                        Text(Image(systemName: "square.and.pencil"))                            .foregroundColor(isDone ? Color("CGrey") : .white)
                        
                    })
                    .padding()
                }
            }
            
            if isExpanded {
                HStack{
                    VStack{
                        Text("Weight")
                            .font(.system(size: 20, weight: .bold, design: .default))
                            .foregroundColor(isDone ? Color("CGrey") : .white)
                        Text("\(String(exercise.weight)) lbs")
                            .font(.system(size: 17, weight: .light, design: .default))
                            .foregroundColor(isDone ? Color("CGrey") : .white)
                    }
                    .padding(.leading)
                    .padding(.trailing)
                    
                    VStack{
                        Text("Reps")
                            .font(.system(size: 20, weight: .bold, design: .default))
                            .foregroundColor(isDone ? Color("CGrey") : .white)
                        Text(exercise.reps)
                            .font(.system(size: 17, weight: .light, design: .default))
                            .foregroundColor(isDone ? Color("CGrey") : .white)
                    }
                    .padding(.leading)
                    .padding(.trailing)
                    
                    VStack{
                        Text("Sets")
                            .font(.system(size: 20, weight: .bold, design: .default))
                            .foregroundColor(isDone ? Color("CGrey") : .white)
                        Text(exercise.sets)
                            .font(.system(size: 17, weight: .light, design: .default))
                            .foregroundColor(isDone ? Color("CGrey") : .white)
                    }
                    .padding(.leading)
                    .padding(.trailing)
                }            .padding(.bottom)
                
            }
            
        }
        .transition(.move(edge: .bottom))
        .frame(maxWidth: .infinity, alignment: .center)
        .background(isDone ?         LinearGradient(gradient: Gradient(colors: [Color("LightCyan"), Color("LightBlue")]), startPoint: .top, endPoint: .bottom)
 :         LinearGradient(gradient: Gradient(colors: [Color("LightCyan"), Color("OxfordBlue")]), startPoint: .top, endPoint: .bottom)
)
        .modifier(CardModifier())
        .padding(.all, 10)
    }
}

struct CardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .cornerRadius(10)
            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 0)
    }
    
}
struct ExerciseCard_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseCard(exercise: Exercise(id: "123", name: "Dumbbell Bench Press", weight: "50", sets: "2", reps: "8", category: "Chest"), fromWorkoutList: false, onSelectionPage: true)
    }
}
