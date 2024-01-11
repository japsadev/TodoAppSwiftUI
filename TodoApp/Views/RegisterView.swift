//
//  RegisterView.swift
//  TodoApp
//
//  Created by japsa on 9.01.2024.
//

import SwiftUI

struct RegisterView: View {
    
//    @State var name: String = ""
//    @State var email: String = ""
//    @State var password: String = ""
    
    @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
        NavigationStack{
            VStack{
                //MARK: Header
                HeaderView()
                //MARK: Form
                Form{
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundStyle(.red)
                    }
                    Section(header: Text("Register Form")) {
                        TextField("Full Name", text: $viewModel.name)
                            .autocorrectionDisabled()
                        TextField("E-mail", text: $viewModel.email)
                            .autocorrectionDisabled()
                            .autocapitalization(.none)
                        SecureField("Password", text: $viewModel.password)
                    }
                }
                .frame(height: 250)
                
                BigButtonView(title: "Register", action: {
                    viewModel.register()
                })
                Spacer()
                    
                }
        }
    }
}

#Preview {
    RegisterView()
}
