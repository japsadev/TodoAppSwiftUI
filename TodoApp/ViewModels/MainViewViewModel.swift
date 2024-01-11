//
//  MainViewViewModel.swift
//  TodoApp
//
//  Created by japsa on 9.01.2024.
//

import FirebaseAuth
import Foundation

class MainViewViewModel:ObservableObject{
    @Published var currentUserId: String = "" // id ler google da String olarak tutuluyor
    
    init() {
        Auth.auth().addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
            }
        }
    }
    
    public var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
    }
}
