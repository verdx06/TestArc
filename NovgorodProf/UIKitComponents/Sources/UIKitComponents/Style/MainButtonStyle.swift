//
//  File.swift
//  UIKitComponents
//
//  Created by Виталий Багаутдинов on 20.05.2025.
//

import Foundation
import SwiftUI

public struct MainButtonView: View {
    
    let text: String
    let active: Bool
    let isprogress: Bool
    let action: () -> ()
    
    public init(text: String, active: Bool, isprogress: Bool, action: @escaping () -> Void) {
        self.text = text
        self.active = active
        self.isprogress = isprogress
        self.action = action
    }
    
    public var body: some View {
        if isprogress {
            ProgressView()
                .BenbowFont(size: 17, font: .semibold)
                .foregroundStyle(Color.white)
                .frame(maxWidth: .infinity)
                .frame(height: 56)
                .background(Color(active ? "hex#1A6FEE" : "hex#C9D4FB", bundle: .module))
                .cornerRadius(10)
        } else {
            Button {
                action()
            } label: {
                Text(text)
                    .BenbowFont(size: 17, font: .semibold)
                    .foregroundStyle(Color.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 56)
                    .background(Color(active ? "hex#1A6FEE" : "hex#C9D4FB", bundle: .module))
                    .cornerRadius(10)
            }.disabled(!active)
        }

    }
}
