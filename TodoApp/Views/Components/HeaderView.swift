//
//  HeaderView.swift
//  TodoApp
//
//  Created by japsa on 9.01.2024.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        ZStack{
            Image("todoLogo")
                .resizable()
                .frame(width: 150, height: 150)
                                    
        }.padding(.top, 100)
        Text("Todo")
            .font(.system(size: 50))
            .fontWeight(.bold)
            .padding(.top, 10)
    }
}

#Preview {
    HeaderView()
}
