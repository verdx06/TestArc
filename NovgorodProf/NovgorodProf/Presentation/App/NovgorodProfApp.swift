//
//  NovgorodProfApp.swift
//  NovgorodProf
//
//  Created by Виталий Багаутдинов on 19.05.2025.
//

import SwiftUI

@main
struct NovgorodProfApp: App {
    var body: some Scene {
        WindowGroup {
            LoginView(lvm: LoginViewModel(domain: AuthorizateAssembly.useCase()))
//            RegisterView(rvm: RegisterViewModel(domain: AuthorizateAssembly.useCase()))
        }
    }
}
