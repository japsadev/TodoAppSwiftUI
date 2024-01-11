//
//  BigButtonView.swift
//  TodoApp
//
//  Created by japsa on 9.01.2024.
//

import SwiftUI

struct BigButtonView: View {
    
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action, label: {
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .foregroundStyle(.primary)
                Text(title)
                    .foregroundColor(.white)
            }
        })
        .frame(height: 50)
        .padding(.horizontal)
        
    }
}

#Preview {
    BigButtonView(title: "Big Button View", action: {})
}
