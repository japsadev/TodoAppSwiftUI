//
//  User.swift
//  TodoApp
//
//  Created by japsa on 9.01.2024.
//

import Foundation

struct User:Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
