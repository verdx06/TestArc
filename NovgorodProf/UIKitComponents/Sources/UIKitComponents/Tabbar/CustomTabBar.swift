//
//  SwiftUIView.swift
//  UIKitComponents
//
//  Created by Виталий Багаутдинов on 23.05.2025.
//

import SwiftUI

public struct CustomTabBar: View {
    let tabs: [String]
    @Binding var selection: String
    
    public var body: some View {
        VStack {
            HStack {
                ForEach(tabs, id: \.self) { tab in
                    Button {
                        selection = tab
                    } label: {
                        VStack {
                            Image(selection == tab ? tab+"Active" : tab,bundle: .module)
                            Text(tab)
                                .foregroundStyle(Color(selection == tab ? "hex#1A6FEE" : "hex#B8C1CC", bundle: .module))
                        }.frame(maxWidth: .infinity)
                            .padding(.vertical, 8)
                    }

                }
                .background(Color.white.edgesIgnoringSafeArea(.horizontal))
            }.padding(6)
        }
    }
}

#Preview {
    CustomTabBar(tabs: ["Главная"], selection: .constant("Главная"))
}
