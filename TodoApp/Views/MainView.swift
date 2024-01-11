//
//  ContentView.swift
//  TodoApp
//
//  Created by japsa on 9.01.2024.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            accountView
        }else{
            LoginView()
        }
    }
    @ViewBuilder
    var accountView: some View{
        TabView{
            TodoListView(userId: viewModel.currentUserId)
                .tabItem {
                    Label("ToDo", systemImage: "list.bullet.circle.fill")
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
        }
    }
}

#Preview {
    MainView()
}
