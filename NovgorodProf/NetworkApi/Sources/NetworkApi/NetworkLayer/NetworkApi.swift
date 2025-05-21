// The Swift Programming Language
// https://docs.swift.org/swift-book

import Alamofire
import Foundation

public struct Constants {
    public static let baseURL = "https://muchobulb-us.backendless.app/api"
}

public final class NetworkApi: NetworkApiProtocol {
    
    private let network: NetworkRequest
    
    public init(network: NetworkRequest) {
        self.network = network
    }
    
    public func login(login: String, password: String) async throws -> ServerResponseModel {
        let data = try await network.execute(path: "users/login", method: .post, parameters: [
            "login" : login,
            "password" : password
        ])
        return try JSONDecoder().decode(ServerResponseModel.self, from: data)
    }
    

    public func register(email: String, password: String, name: String, telegram: String) async throws -> ServerResponseModel {
        let data = try await network.execute(path: "users/register", method: .post, parameters: [
            "email" : email,
            "password" : password,
            "name" : name,
            "telegram" : telegram
        ])
        return try JSONDecoder().decode(ServerResponseModel.self, from: data)
    }
    

}
