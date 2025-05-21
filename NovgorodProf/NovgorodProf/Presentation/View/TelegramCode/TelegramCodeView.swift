//
//  TelegramCodeView.swift
//  NovgorodProf
//
//  Created by Виталий Багаутдинов on 20.05.2025.
//

import SwiftUI
import UIKitComponents

struct TelegramCodeView: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var rvm: RegisterViewModel
    @FocusState var focused: Int?
    
    @State var enterValue: [String] = Array(repeating: "", count: 4)
    
    
    var body: some View {
        VStack(spacing: 0){
            HStack {
                Button {
                    dismiss()
                } label: {
                    Image("back")
                }

                Spacer()
            }.padding(.top, 24)
            Spacer()
            Text("Введите код из Telegram")
                .BenbowFont(size: 17, font: .semibold)
                .padding(.bottom, 24)
            HStack(spacing: 0){
                ForEach(0..<4) {index in
                    OtpTextView(text: $enterValue[index], index: index, focused: $focused)
                        .padding(.trailing, 16)
                }
                .onChange(of: focused) { newValue in
                    if focused == nil {
                        if enterValue.joined() == "1111" {
                            rvm.register()
                        }
                    }
                }
            }
            Spacer()
        }
        .fullScreenCover(isPresented: $rvm.isNavigate, content: {
            ProfileView(user: rvm.user ?? UserModel(email: "", name: "", telegram: ""))
        })
        .navigationBarBackButtonHidden()
            .padding(.horizontal, 20)
    }
}

#Preview {
    TelegramCodeView(rvm: RegisterViewModel(domain: AuthorizateAssembly.useCase()))
}
