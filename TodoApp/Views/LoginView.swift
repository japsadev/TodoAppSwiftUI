//
//  LoginView.swift
//  TodoApp
//
//  Created by japsa on 9.01.2024.
//

import SwiftUI

struct LoginView: View {
    
//    @State var email: String = ""
//    @State var password: String = ""
    
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationStack{
            VStack{
                //MARK: Header
                HeaderView()
               //MARK: Form - email, password and button
                Form{
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundStyle(.red)
                    }
                    TextField("E-mail", text: $viewModel.email)
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                    SecureField("Password", text: $viewModel.password)
                }
                .frame(height: 200)
                
                BigButtonView(title: "Login") {
                    viewModel.login()
                }
                
                Spacer()
            //MARK: Footer - create new account
                    
                VStack{
                    Text("Buralarda yeni misin ?")
                    NavigationLink("Create a new account", destination: RegisterView())
                }
                .padding(.bottom, 150)
            }
        }
    }
}

#Preview {
    LoginView()
}
