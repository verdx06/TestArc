//
//  AppDependencyContainer.swift
//  NovgorodProf
//
//  Created by Виталий Багаутдинов on 24.05.2025.
//


final class AppDependencyContainer {
    static let shared = AppDependencyContainer()
    let container: Container = Container()
    
    init() {
        setupDependencies()
    }
    
    private func setupDependencies() {
        // Общий NetworkAPI (если он синглтон)
        container.register(NetworkAPI.self) { _ in
            NetworkAssembly.netwok
        }.inObjectScope(.container) // Синглтон
        
        // Authorizate модуль
        container.register(AuthorizateRepositoryProtocol.self) { resolver in
            AuthorizateRepository(networkApi: resolver.resolve(NetworkAPI.self)!)
        }
        
        container.register(CharacterServiceProtocol.self) { resolver in
            CharacterService(repository: resolver.resolve(AuthorizateRepositoryProtocol.self)!)
        }
        
        // Profile модуль
        container.register(ImageRepositoryProtocol.self) { resolver in
            ImageRepository(network: resolver.resolve(NetworkAPI.self)!)
        }
        
        container.register(ImageServiceProtocol.self) { resolver in
            ImageCharacterService(data: resolver.resolve(ImageRepositoryProtocol.self)!)
        }
    }
}
