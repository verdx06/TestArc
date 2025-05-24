//
//  CharacterService.swift
//  NovgorodProf
//
//  Created by Виталий Багаутдинов on 21.05.2025.
//

import Foundation

final class CharacterService: CharacterServiceProtocol {
        
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
    
    
    func checkValidPassword(_ password: String) -> Bool {
        let count = password.count >= 8
        let number = password.contains { $0.isNumber }
        let upper = password.contains { $0.isUppercase }
        let low = password.contains { $0.isLowercase }
        let symb = password.rangeOfCharacter(from: .symbols) != nil || password.rangeOfCharacter(from: .punctuationCharacters) != nil
        
        return count && number && upper && low && symb
    }
    
}
