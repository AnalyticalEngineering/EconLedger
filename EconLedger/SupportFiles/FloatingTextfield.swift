//
//  FloatingTextfield.swift
//  EconLedger
//
//  Created by J. DeWeese on 11/28/23.
//

import SwiftUI

struct FloatingTextField: View {
    let title: String
    @Binding var text: String
    var axis: Axis = .horizontal
    
    var body: some View {
        ZStack(alignment: .leading) {
            GeometryReader { geo in
                Text(title)
                    .foregroundColor(text.isEmpty ? Color(.placeholderText) : .accentColor)
                    .offset(y: text.isEmpty ? 0 : -25)
                    .scaleEffect(text.isEmpty ? 1 : 0.75, anchor: .leading)
                TextField("", text: $text, axis: axis)
                 
            }
            
          .padding(.top,  15)
            .animation(.spring(response: 0.4, dampingFraction: 0.3), value: text)
        }
    }
}
