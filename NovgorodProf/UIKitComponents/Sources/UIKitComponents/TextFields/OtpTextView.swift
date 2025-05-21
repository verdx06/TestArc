//
//  OtpTextView.swift
//  UIKitComponents
//
//  Created by Виталий Багаутдинов on 20.05.2025.
//

import SwiftUI

public struct OtpTextView: View {
    @Binding var text: String
    var index: Int
    @FocusState.Binding var focused: Int?
    
    public init(text: Binding<String>, index: Int, focused: FocusState<Int?>.Binding) {
        self._text = text
        self.index = index
        self._focused = focused
    }
    
    public var body: some View {
        TextField("", text: $text)
            .BenbowFont(size: 20)
            .keyboardType(.numberPad)
            .frame(width: 48, height: 48)
            .cornerRadius(10)
            .focused($focused, equals: index)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(Color("hex#F5F5F9", bundle: .module))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 1)
                            .foregroundStyle(Color("hex#EBEBEB", bundle: .module))
                    )
            )
            .multilineTextAlignment(.center)
            .onChange(of: text) { newValue in
                if text.count == 3 {
                    focused = nil
                }
                else {
                    focused = (focused ?? 0) + 1
                }
            }
    }
}
