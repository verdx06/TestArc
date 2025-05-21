//
//  RegisterView.swift
//  NovgorodProf
//
//  Created by Виталий Багаутдинов on 20.05.2025.
//

import SwiftUI
import UIKitComponents

struct RegisterView: View {
    
    @StateObject var rvm: RegisterViewModel
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 0) {
                Text("Создание Профиля")
                    .BenbowFont(size: 24, font: .bold)
                    .padding(.top, 32)
                Text("Без профиля вы не сможете создавать проекты.")
                    .padding(.top, 44)
                    .padding(.bottom, 8)
                    .BenbowFont(size: 14)
                    .foregroundStyle(Color.hex939396)
                Text("В профиле будут храниться результаты проектов и\nваши описания.")
                    .BenbowFont(size: 14)
                    .foregroundStyle(Color.hex939396)
                
                CustomTextField(title: "", example: "Имя", text: $rvm.firstName)
                    .padding(.top, 32)
                CustomTextField(title: "", example: "Отчество", text: $rvm.BatyaName)
                    .padding(.top, 24)
                CustomTextField(title: "", example: "Фамилия", text: $rvm.secondName)
                    .padding(.top, 24)
                CustomTextField(title: "", example: "Дата рождения", text: $rvm.birthday)
                    .padding(.top, 24)
                CustomTextField(title: "", example: "Пол", picker: true, text: $rvm.gender)
                    .padding(.top, 24)
                CustomTextField(title: "", example: "Telegram", text: $rvm.telegram)
                    .padding(.top, 24)
                
                MainButtonView(text: "Создать", active: rvm.activeButton(), isprogress: false) {
                    rvm.isCode = true
                }
                .padding(.top, 68)
                .padding(.bottom, 32)
            }.padding(.horizontal, 20)
                .navigationDestination(isPresented: $rvm.isCode) {
                    TelegramCodeView(rvm: rvm)
                }
        }
    }
}

#Preview {
    RegisterView(rvm: RegisterViewModel(domain: AuthorizateAssembly.useCase()))
}
