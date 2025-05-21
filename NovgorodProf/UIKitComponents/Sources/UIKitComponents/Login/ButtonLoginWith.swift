//
//  SwiftUIView.swift
//  UIKitComponents
//
//  Created by Виталий Багаутдинов on 20.05.2025.
//

import SwiftUI

public struct ButtonLoginWith: View {
    
    let text: String
    let image: String
    let action: () -> ()
    
    public init(text: String, image: String, action: @escaping () -> Void) {
        self.text = text
        self.image = image
        self.action = action
    }
    
    public var body: some View {
        Button {
            action()
        } label: {
            HStack(spacing: 0){
                Image(image)
                    .padding(.horizontal, 16)
                Text(text)
                    .BenbowFont(size: 17, font: .semibold)
                    .foregroundStyle(.black)
            }.frame(maxWidth: .infinity)
                .frame(height: 60)
            .overlay {
                RoundedRectangle(cornerRadius: 12)
                    .stroke(lineWidth: 1)
                    .foregroundColor(Color("hex#EBEBEB", bundle: .module))
            }
        }

    }
}

#Preview {
    ButtonLoginWith(text: "", image: "") {
        
    }
}
