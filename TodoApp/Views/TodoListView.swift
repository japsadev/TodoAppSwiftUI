//
//  TodoListView.swift
//  TodoApp
//
//  Created by japsa on 9.01.2024.
//

import FirebaseFirestoreSwift
import SwiftUI

struct TodoListView: View {
    
    @StateObject var viewModel: TodoListViewViewModel
    @FirestoreQuery var items: [TodoListItem]
    
    init(userId:String){
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._viewModel = StateObject(wrappedValue: TodoListViewViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView{
            VStack{
                List(items){ item in
                    TodoListItemView(item: item)
                        .swipeActions{
                            Button("Delete"){
                                viewModel.delete(id: item.id)
                            }
                            .background(Color.red)
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("ToDo")
            .toolbar{
                Button{
                    // Opening Sheet Codes
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus.circle.fill")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView,
                   content: {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            })
        }
    }
}

#Preview {
    TodoListView(userId: "617qgg0jAbVaYrW7UVPAeD8ddyn1")
}
