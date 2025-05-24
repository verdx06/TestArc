//
//  LoginAssembly.swift
//  NovgorodProf
//
//  Created by Виталий Багаутдинов on 21.05.2025.
//

import Foundation
import NetworkApi

final class AllAssembly {
    
    static func useCase<Service: Any, Repository: Any>(
        repositoryType: Repository.Type,
        serviceType: Service.Type
    ) -> Service {
        let repository = Repository(networkApi: NetworkAssembly.netwok)
        let service = CharacterService(repository: repository)
        return service
    }
    
}
