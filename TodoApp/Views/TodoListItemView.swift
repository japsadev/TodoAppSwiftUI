//
//  TodoListItemView.swift
//  TodoApp
//
//  Created by japsa on 9.01.2024.
//

import SwiftUI

struct TodoListItemView: View {
    
    @StateObject var viewModel = TodoListItemViewViewModel()
    
    let item: TodoListItem
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(item.title)
                    .font(.title)
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundStyle(Color(.secondaryLabel))
            }
            Spacer()
            Button{
                viewModel.toggleIsDone(item: item)
                } label: {
                    Image(systemName: item.isDone ? 
                          "checkmark.circle.fill" : "circle")
                        .foregroundStyle(Color.blue)
            }
        }
    }
}

#Preview {
    TodoListItemView(item: .init(
        id: "123",
        title: "Deneme123",
        dueDate: Date().timeIntervalSince1970,
        createdDate: Date().timeIntervalSince1970,
        isDone: false))
}
