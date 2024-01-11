//
//  TodoListItem.swift
//  TodoApp
//
//  Created by japsa on 9.01.2024.
//

import Foundation

struct TodoListItem: Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    let isDone: Bool
    
    mutating func setDone(_ state: Bool) {
      let isDone = state
    }
}
