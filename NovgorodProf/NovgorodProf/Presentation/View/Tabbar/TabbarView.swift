//
//  TabbarView.swift
//  NovgorodProf
//
//  Created by Виталий Багаутдинов on 23.05.2025.
//

import SwiftUI
import UIKitComponents

struct TabbarView: View {
    
    @State var selection: String = "Главная"
    let user: UserModel
    
    var body: some View {
        VStack {
            CustomTabBarContainer(selectionTab: $selection) {
                Color.red
                    .tabBar(tab: "Главная", selection: $selection)
                Color.blue
                    .tabBar(tab: "Каталог", selection: $selection)
                Color.gray
                    .tabBar(tab: "Проекты", selection: $selection)
                ProfileView(user: user, pvm: ProfileViewModel(domain: ProfileAssembly.useCase()))
                    .tabBar(tab: "Профиль", selection: $selection)
            }
        }
    }
}


#Preview {
    TabbarView(user: UserModel.empty)
}
