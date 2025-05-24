//
//  TelegramCodeAssembly.swift
//  NovgorodProf
//
//  Created by Виталий Багаутдинов on 24.05.2025.
//

import Foundation

final class TelegramCodeAssembly {
    
    static func useCase() -> ImageServiceProtocol {
        let repository: ImageRepositoryProtocol = ImageRepository(network: NetworkAssembly.network(type: .baseURL))
        let service: ImageServiceProtocol = ImageCharacterService(data: repository)
        return service
    }
    
}
    
