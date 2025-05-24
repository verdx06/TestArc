//
//  File.swift
//  UIKitComponents
//
//  Created by Виталий Багаутдинов on 23.05.2025.
//

import Foundation
import SwiftUI

public struct TabBarPreferenceKey: PreferenceKey {
    
    public static let defaultValue: [String] = []
    
    public static func reduce(value: inout [String], nextValue: () -> [String]) {
        value += nextValue()
    }
    
}

struct TabBarItemViewModifer: ViewModifier {
    
    let tab: String
    @Binding var selection: String
    
    func body(content: Content) -> some View {
        content
            .opacity(selection == tab ? 1 : 0)
            .preference(key: TabBarPreferenceKey.self, value: [tab])
    }
    
}

public extension View {
    
    func tabBar(tab: String, selection: Binding<String>) -> some View {
        self
            .modifier(TabBarItemViewModifer(tab: tab, selection: selection))
    }
    
}
