//
//  TelegramAssembly.swift
//  NovgorodProf
//
//  Created by Виталий Багаутдинов on 24.05.2025.
//

import Foundation
import NetworkApi

final class TelegramAssembly {
    
    static func useCase() -> TelegramServiceProtocol{
        let repository: TelegramRepositoryProtocol = TelegramRepository(network: NetworkTelegramAssembly.network)
        let service: TelegramServiceProtocol = CharacterServiceTelegram(repository: repository)
        return service
    }
    
}
