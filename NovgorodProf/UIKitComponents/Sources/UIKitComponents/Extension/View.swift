//
//  File.swift
//  UIKitComponents
//
//  Created by Виталий Багаутдинов on 19.05.2025.
//

import Foundation
import SwiftUI

public extension View {
    
    func BenbowFont(size: CGFloat, font: Font.Weight = .regular) -> some View {
        switch font {
        case .bold:
            self
                .font(.custom("Benbow Bold", size: size))
        case .semibold:
            self
                .font(.custom("Benbow Semibold", size: size))
        default:
            self
                .font(.custom("Benbow Regular", size: size))
        }
    }
    
}
