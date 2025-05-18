//
//  ContentView.swift
//  TestClean
//
//  Created by Виталий Багаутдинов on 18.05.2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm: ViewModel
    
    var body: some View {
        VStack {
                List(vm.post) { post in
                    VStack(alignment: .leading) {
                        Text(post.title ?? "No title")
                            .font(.headline)
                        Text(post.body ?? "No content")
                            .font(.subheadline)
                    }
            }
        }
        .task {
            await vm.loadPost()
        }
    }
}

#Preview {
    ContentView(vm: ContentAssembly.useCase())
}
