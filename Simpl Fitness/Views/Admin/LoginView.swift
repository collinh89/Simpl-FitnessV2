//
//  LoginView.swift
//  Simpl Fitness
//
//  Created by Collin Holthaus on 6/8/23.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    
    init(){
        UITableView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        NavigationView {
            VStack{
                //SF Logo
                Image("SF Logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                //login form
                Form {
                    Section{
                        if !viewModel.errorMsg.isEmpty{
                            Text(viewModel.errorMsg)
                                .foregroundColor(Color.red)
                        }
                        TextField("Email Address", text: $viewModel.email)
                            .textFieldStyle(DefaultTextFieldStyle())
                            .autocapitalization(.none)
                            .autocorrectionDisabled()
                        SecureField("Password", text: $viewModel.password)
                            .textFieldStyle(DefaultTextFieldStyle())
                    }
                }
                Button("Login"){
                    viewModel.login()
                }
                .frame(maxWidth: 200, alignment: .center).padding()
                .foregroundColor(Color("OxfordBlue"))
                .background(Color("LightBlue")).cornerRadius(5)
                Spacer()
                //create account
                VStack{
                    Text("New Around Here?")
                    NavigationLink("Create An Account",destination: RegisterView())
                }
                .padding()
                Spacer()
            }
            .scrollContentBackground(.hidden)
            .foregroundColor(Color("CadetGrey"))
            .background(Color("OxfordBlue"))
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
