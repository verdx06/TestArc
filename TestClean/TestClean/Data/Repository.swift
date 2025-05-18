//
//  Repository.swift
//  TestClean
//
//  Created by Виталий Багаутдинов on 18.05.2025.
//

import Foundation
import NetworkApi

final class PostRepository: PostRepositoryProtocol {
    
    private let network: NetworkApi
    
    init(network: NetworkApi) {
        self.network = network
    }
    
    func fetchPosts() async throws -> [PostModel] {
        let response = try await network.getPosts()
        return response.map { serverPost in
            PostModel(
                userId: serverPost.userId,
                id: serverPost.id,
                title: serverPost.title,
                body: serverPost.body
            )
        }
    }
    
    
}
