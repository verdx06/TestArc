//
//  SwiftUIView.swift
//  UIKitComponents
//
//  Created by Виталий Багаутдинов on 23.05.2025.
//

import SwiftUI

public struct SearchFIeldView: View {
    
    @Binding var text: String
    
    public init(text: Binding<String>) {
        self._text = text
    }
    
    public var body: some View {
        ZStack {
            TextField("", text: $text)
                .padding(.horizontal, 45)
                .frame(maxWidth: .infinity)
                .frame(height: 48)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundStyle(Color("hex#F5F5F9", bundle: .module))
                        .overlay(content: {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(lineWidth: 1)
                                .foregroundStyle(Color("hex#EBEBEB", bundle: .module))
                        })
                )
            HStack {
                Image("search", bundle: .module)
                if text.isEmpty {
                    Text("Искать  описания")
                        .foregroundStyle(Color("hex#939396", bundle: .module))
                }
                Spacer()
            }.padding(.horizontal)
        }
    }
}

#Preview {
    SearchFIeldView(text: .constant(""))
}
