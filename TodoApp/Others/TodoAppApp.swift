//
//  TodoAppApp.swift
//  TodoApp
//
//  Created by japsa on 9.01.2024.
//

import FirebaseCore
import SwiftUI

@main
struct TodoAppApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
