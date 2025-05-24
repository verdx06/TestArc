//
//  Repository.swift
//  NovgorodProf
//
//  Created by Виталий Багаутдинов on 21.05.2025.
//

import Foundation
import NetworkApi

final class AuthorizateRepository: AuthorizateRepositoryProtocol {
    
    private let networkApi: NetworkBaseApiProtocol
    
    init(networkApi: NetworkBaseApiProtocol) {
        self.networkApi = networkApi
    }
    
    func login(login: String, password: String) async throws -> UserModel {
        let result = try await networkApi.login(login: login, password: password)
        return UserModel(from: result)
    }
    
    func register(email: String, password: String, name: String, telegram: String) async throws -> UserModel {
        let result = try await networkApi.register(email: email, password: password, name: name, telegram: telegram)
        return UserModel(from: result)
    }    
    
}
