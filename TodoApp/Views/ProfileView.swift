//
//  ProfileView.swift
//  TodoApp
//
//  Created by japsa on 9.01.2024.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel = ProfileViewViewModel()
    
    init(){}
    
    var body: some View {
        NavigationView{
            VStack{
                
                if let user = viewModel.user {
                    profile(user: user)
                } else {
                    Text("Profile Loading...")
                }
                // add logout button
                BigButtonView(title: "Logout") {
                    viewModel.logout()
                }
            }
            .navigationTitle("Profile")
        }
        .onAppear{
            viewModel.fetchUser()
        }
    }
    @ViewBuilder
    func profile(user: User) -> some View {
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundStyle(Color.blue)
            .frame(width: 125, height: 125)
        
        VStack{
            HStack{
                Text("Name:")
                Text(user.name)
            }
            HStack{
                Text("Email:")
                Text(user.email)
            }
            HStack{
                Text("Joined Date:")
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
        }
    }
}

#Preview {
    ProfileView()
}
