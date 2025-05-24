//
//  RegisterView.swift
//  NovgorodProf
//
//  Created by Виталий Багаутдинов on 20.05.2025.
//

import SwiftUI
import UIKitComponents

struct CreateProfileView: View {
    
    @StateObject var cvm = CreateProfileViewModel()
    @StateObject var rvm = RegisterViewModel()
    
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
                CustomTextField(title: "", example: "Фамилия", text: $rvm.secondName)
                    .padding(.top, 24)
                CustomTextField(title: "", example: "Телефон", text: $rvm.phone)
                    .padding(.top, 24)
                if !cvm.error.isEmpty {
                    HStack {
                        Text(cvm.error)
                            .BenbowFont(size: 15)
                            .foregroundStyle(Color.red)
                        Spacer()
                    }
                }
                CustomTextField(title: "", example: "Дата рождения", text: $rvm.birthday)
                    .padding(.top, 24)
                CustomTextField(title: "", example: "Пол", picker: true, text: $rvm.gender)
                    .padding(.top, 24)
                CustomTextField(title: "", example: "Telegram", text: $rvm.telegram)
                    .padding(.top, 24)
                
                MainButtonView(text: "Создать", active: rvm.activeButton(), isprogress: cvm.isProgress) {
                    cvm.sendCode(phone: rvm.phone)
                }
                .padding(.top, 68)
                .padding(.bottom, 32)
            }.padding(.horizontal, 20)
                .navigationDestination(isPresented: $cvm.isCode) {
                    TelegramCodeView(code: cvm.code, rvm: rvm)
                }
        }
    }
}

#Preview {
    CreateProfileView(cvm: CreateProfileViewModel(domain: TelegramAssembly.useCase()))
}
