//
//  LoginAssembly.swift
//  NovgorodProf
//
//  Created by Виталий Багаутдинов on 21.05.2025.
//

import Foundation
import NetworkApi

final class AuthorizateAssembly {
    
    private static let network: BaseNetworkService = {
        let service = BaseNetworkService()
        service.configure(baseURL: Constants.baseURL)
        return service
    }()
    
    static func useCase() -> AuthorizateProtocol {
        let netwok = NetworkApi(network: network)
        let repository: AuthorizateRepositoryProtocol = Repository(networkApi: netwok)
        let service = CharacterService(repository: repository)
        return service
    }
    
}
