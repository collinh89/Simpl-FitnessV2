//
//  ProfileView.swift
//  Simpl Fitness
//
//  Created by Collin Holthaus on 6/8/23.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    var body: some View {
        NavigationView{
            ZStack{
                Color("CadetGrey")
                    .ignoresSafeArea()
                VStack{
                    if let user = viewModel.user {
                        profile(user: user)
                    } else{
                        Text("Loading Profile ...")
                    }
                }
                .foregroundColor(Color("OxfordBlue"))
            }
        }
        .onAppear{
            viewModel.fetchUser()
        }
    }
    @ViewBuilder func profile(user: User) -> some View{
//        Image(systemName: "person.circle")
//            .resizable()
//            .aspectRatio(contentMode: .fit)
//            .foregroundColor((Color("OxfordBlue")))
//            .frame(width: 125, height: 125)
//            .padding()
        Image("SF Logo Blue")
            .resizable()
            .aspectRatio(contentMode: .fit)
        
        VStack(alignment: .center){
            Text(user.name)
                .font(.title2)
                .padding()
            
            Text(user.email)
                .font(.title2)
                .padding()
            
            Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
                .font(.title2)
                .padding()
            
            
        }
        Spacer()
        Button("Logout"){
            viewModel.logout()
        }
        .tint(.red)
        .frame(maxWidth: 200, alignment: .center).padding()
        .foregroundColor(Color("OxfordBlue"))
        .background(Color("LightBlue")).cornerRadius(5)
        .padding()
        Spacer()
    }
}



struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
