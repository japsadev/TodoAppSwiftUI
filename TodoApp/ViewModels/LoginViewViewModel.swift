//
//  LoginViewViewModel.swift
//  TodoApp
//
//  Created by japsa on 9.01.2024.
//

import FirebaseAuth
import Foundation

class LoginViewViewModel: ObservableObject{
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String = ""
    
    init(){}
    
    func login(){
        guard validate() else {
            return
        }
        Auth.auth().signIn(withEmail: email, link: password)
        
        }
    
    
    func validate() -> Bool {
        errorMessage = ""
        
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty
        else {
            errorMessage = "Lütfen tüm alanları doldurun"
            return false
        }
            guard email.contains("@") && email.contains(".") else {
                errorMessage = "Lütfen geçerli bir email adresi girin"
                return false
            }
        return true
    }
}
