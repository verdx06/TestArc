//
//  TestCleanApp.swift
//  TestClean
//
//  Created by Виталий Багаутдинов on 18.05.2025.
//

import SwiftUI

@main
struct TestCleanApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(vm: ContentAssembly.useCase())
        }
    }
}
