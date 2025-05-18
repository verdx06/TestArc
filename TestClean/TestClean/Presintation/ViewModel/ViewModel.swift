//
//  ViewModel.swift
//  TestClean
//
//  Created by Виталий Багаутдинов on 18.05.2025.
//

import Foundation


class ViewModel: ObservableObject {
    @Published var post: [PostModel] = []
    
    private let repository: PostRepositoryProtocol
    
    init(repository: PostRepositoryProtocol) {
        self.repository = repository
    }
    
    @MainActor
    func loadPost() async {
        do {
            self.post = try await self.repository.fetchPosts()
            print("ok")
        }
        catch {
            print(error.localizedDescription)
            
        }
    }
    
}
