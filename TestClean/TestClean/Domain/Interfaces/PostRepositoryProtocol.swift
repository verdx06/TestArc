//
//  UserRepository.swift
//  TestClean
//
//  Created by Виталий Багаутдинов on 18.05.2025.
//

import Foundation

protocol PostRepositoryProtocol {
    func fetchPosts() async throws -> [PostModel]
}
