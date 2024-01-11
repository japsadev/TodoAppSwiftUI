//
//  RegisterViewViewModel.swift
//  TodoApp
//
//  Created by japsa on 9.01.2024.
//

import FirebaseFirestore
import FirebaseAuth
import Foundation

class RegisterViewViewModel: ObservableObject{
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String = ""
    
    init() {}
    
    func register() {
        guard validate() else{
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result,
            error in
            guard let userId = result?.user.uid else{
                return
            }
            // insert method will called
            self?.insertUserRecord(id: userId)
        }
    }
    
    private func insertUserRecord(id: String){
        let newUser = User(id: id, name: name, email: email, joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary()) // Convert to dictionary with DB+Extension
    }
    
    private func validate() -> Bool {
        errorMessage = ""
        
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else{
            errorMessage = "Lütfen tüm alanları doldurun"
            return false
        }
            guard email.contains("@") && email.contains(".") else {
                errorMessage = "Lütfen geçerli bir email adresi girin"
                return false
            }
        
        guard password.count >= 6 else{
            errorMessage = "Lütfen 6 veya daha fazla karakterli bir şifre girin"
            return false 
        }
        
        return true
    }
}
