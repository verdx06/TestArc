//
//  CharacterService.swift
//  TestClean
//
//  Created by Виталий Багаутдинов on 18.05.2025.
//

import Foundation

final class CharacterService: PostRepositoryProtocol {

    private let repository: PostRepositoryProtocol
    
    init(repository: PostRepositoryProtocol) {
        self.repository = repository
    }

    func fetchPosts() async throws -> [PostModel] {
        return try await repository.fetchPosts()
    }
    
}
