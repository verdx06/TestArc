//
//  LoginAssembly.swift
//  NovgorodProf
//
//  Created by Виталий Багаутдинов on 21.05.2025.
//

import Foundation
import NetworkApi
import Swinject

final class AuthorizateAssembly {
    
    static func useCase() -> CharacterServiceProtocol {
        let repository: AuthorizateRepositoryProtocol = AuthorizateRepository(networkApi: NetworkBaseAssembly.network)
        let service = CharacterService(repository: repository)
        return service
    }
    
}
