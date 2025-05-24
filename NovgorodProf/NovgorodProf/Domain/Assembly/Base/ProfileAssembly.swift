//
//  ProfileAssembly.swift
//  NovgorodProf
//
//  Created by Виталий Багаутдинов on 22.05.2025.
//

import Foundation
import NetworkApi

final class ProfileAssembly {
    
    static func useCase() -> ImageServiceProtocol {
        let repository: ImageRepositoryProtocol = ImageRepository(network: NetworkBaseAssembly.network)
        let service: ImageServiceProtocol = ImageCharacterService(data: repository)
        return service
    }
    
}
	
