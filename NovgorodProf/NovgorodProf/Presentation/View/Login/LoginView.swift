//
//  ContentView.swift
//  NovgorodProf
//
//  Created by Виталий Багаутдинов on 19.05.2025.
//

import SwiftUI
import UIKitComponents

struct LoginView: View {
    
    @StateObject var lvm: LoginViewModel
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                VStack(alignment: .leading){
                    HStack {
                        Image("hello")
                        Text("Добро пожаловать!")
                            .BenbowFont(size: 24, font: .semibold)
                        Spacer()
                    }.padding(.bottom, 25)
                    Text("Войдите, чтобы пользоваться функциями\nприложения")
                        .BenbowFont(size: 15)
                        .padding(.bottom, 64)
                }.padding(.top, 56)
                
                CustomTextField(title: "Вход по E-mail", example: "example@mail.com", errorMessage: lvm.emailError, text: $lvm.email)
                    .padding(.bottom, 14)
                
                CustomTextField(title: "Пароль", example: "", security: true, errorMessage: lvm.passwordError, text: $lvm.password)
                    .padding(.bottom, 14)
                
                MainButtonView(text: "Далее", active: lvm.activeButton(), isprogress: lvm.isProgress) {
                    if lvm.checkError() {
                        lvm.login()
                    }
                    
                }
                
                NavigationLink {
                    //ВЬЮ FORGOTPASSWORD
                } label: {
                    Text("Забыл пароль?")
                        .foregroundStyle(Color.hex1A6FEE)
                        .BenbowFont(size: 15)
                }.padding(.top, 15)
                
                Text("Или войдите с помощью")
                    .foregroundStyle(.hex939396)
                    .BenbowFont(size: 15)
                    .padding(.top, 59)

                ButtonLoginWith(text: "Войти с VK", image: "vk") {
                    //РЕАЛИЗАЦИЯ WKWEBVIEW
                }.padding(.vertical, 16)
                
                ButtonLoginWith(text: "Войти с Yandex", image: "yandex") {
                    //РЕАЛИЗАЦИЯ WKWEBVIEW
                }.padding(.bottom, 56)
                
            }
            .fullScreenCover(isPresented: $lvm.isNavigate, content: {
                TabbarView(user: lvm.user ?? UserModel.empty)
            })
            .padding(.horizontal, 20)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    LoginView(lvm: LoginViewModel(domain: AuthorizateAssembly.useCase()))
}
