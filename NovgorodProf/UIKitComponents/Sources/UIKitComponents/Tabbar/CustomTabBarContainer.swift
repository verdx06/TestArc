//
//  SwiftUIView.swift
//  UIKitComponents
//
//  Created by Виталий Багаутдинов on 23.05.2025.
//

import SwiftUI

public struct CustomTabBarContainer<Content: View>: View {
    
    @Binding var selectionTab: String
    let content: Content
    @State var tabs: [String] = []
    
    public init(selectionTab: Binding<String>, @ViewBuilder content: () -> Content) {
        self._selectionTab = selectionTab
        self.content = content()
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            ZStack {
                content
            }
            CustomTabBar(tabs: tabs, selection: $selectionTab)
        }
        .onPreferenceChange(TabBarPreferenceKey.self) { value in
            self.tabs = value
        }
    }
}

#Preview {
    CustomTabBarContainer(selectionTab: .constant("Главная")) {
        Color.red
            .tabBar(tab: "Главная", selection: .constant("Главная"))
    }
}
