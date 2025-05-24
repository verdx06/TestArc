//
//  CharacterServiceTelegram.swift
//  NovgorodProf
//
//  Created by Виталий Багаутдинов on 24.05.2025.
//

import Foundation


final class CharacterServiceTelegram: TelegramServiceProtocol {
    
    let repository: TelegramRepositoryProtocol
    
    init(repository: TelegramRepositoryProtocol) {
        self.repository = repository
    }
    
    func sendCode(phone: String, code: Int) async throws -> TelegramModel {
        return try await repository.sendCode(phone: phone, code: code)
    }
    
}
