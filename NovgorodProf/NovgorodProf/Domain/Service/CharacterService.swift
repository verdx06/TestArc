//
//  CharacterService.swift
//  NovgorodProf
//
//  Created by Виталий Багаутдинов on 21.05.2025.
//

import Foundation

final class CharacterService: AuthorizateProtocol {
    
    
    private let repository: AuthorizateRepositoryProtocol
    
    init(repository: AuthorizateRepositoryProtocol) {
        self.repository = repository
    }
    
    func login(login: String, password: String) async throws -> UserModel {
        return try await repository.login(login: login, password: password)
    }
    
    func register(email: String, password: String, name: String, telegram: String) async throws -> UserModel {
        return try await repository.register(email: email, password: password, name: name, telegram: telegram)
    }
    
    
}
