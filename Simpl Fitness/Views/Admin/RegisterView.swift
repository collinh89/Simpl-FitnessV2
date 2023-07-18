//
//  RegisterView.swift
//  Simpl Fitness
//
//  Created by Collin Holthaus on 6/8/23.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    var body: some View {
        VStack{
            Image("SF Logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Form{
                TextField("Full Name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                TextField("Email Address", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
            }
    
            Spacer()
            Button("Register"){
                viewModel.register()
            }
            .frame(maxWidth: 200, alignment: .center).padding()
            .foregroundColor(Color("OxfordBlue"))
            .background(Color("LightBlue")).cornerRadius(5)
        }
        .scrollContentBackground(.hidden)
        .foregroundColor(Color("CadetGrey"))
        .background(Color("OxfordBlue"))
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
