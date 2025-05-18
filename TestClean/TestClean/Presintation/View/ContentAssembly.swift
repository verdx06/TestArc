//
//  ContentAssembly.swift
//  TestClean
//
//  Created by Виталий Багаутдинов on 18.05.2025.
//

import Foundation
import NetworkApi

final class ContentAssembly {
    
    private static let networkService: BaseNetworkService = {
        let service = BaseNetworkService()
        service.configute(baseURL: Constants.baseURL)
        return service
    }()
    
    static func useCase() -> ViewModel {
        let network = NetworkApi(network: networkService)
        let repository: PostRepositoryProtocol = PostRepository(network: network)
        let service = CharacterService(repository: repository)
        return ViewModel(repository: service)
    }
    
}
