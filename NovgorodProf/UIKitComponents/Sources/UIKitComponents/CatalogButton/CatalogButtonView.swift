//
//  SwiftUIView.swift
//  UIKitComponents
//
//  Created by Виталий Багаутдинов on 23.05.2025.
//

import SwiftUI

public struct CatalogButtonView: View {
    
    let title: String
    let action: () -> ()
    @State var isPressed: Bool = false
    
    public init(title: String, action: @escaping () -> Void) {
        self.title = title
        self.action = action
    }
    
    public var body: some View {
        Button {
            action()
            isPressed.toggle()
        } label: {
            Text(title)
                .BenbowFont(size: 15, font: .bold)
                .foregroundStyle(isPressed ? Color.white : Color("hex#7E7E9A", bundle: .module))
                .frame(width: 126, height: 48)
                .background(Color(isPressed ? "hex#1A6FEE" : "hex#F5F5F9", bundle: .module))
                .cornerRadius(10)
        }

    }
}

#Preview {
    CatalogButtonView(title: "Популярное") {
        
    }
}
