// The Swift Programming Language
// https://docs.swift.org/swift-book

import Alamofire
import Foundation

public struct ConstantsBase {
    public static let baseURL = "https://muchobulb-us.backendless.app/api"
    static let baseToken = "3101047D-6DD7-45C2-983A-F9C574510CA4"
}

public final class NetworkBaseApi: NetworkBaseApiProtocol {
    
    private let network: NetworkRequest
    
    public init(network: NetworkRequest) {
        self.network = network
    }
    
    private let headers: HTTPHeaders = [
        .contentType("application/json"),
        .accept("application/json"),
        .authorization(ConstantsBase.baseToken)
    ]
    
    public func login(login: String, password: String) async throws -> ServerResponseModel {
        let data = try await network.execute(path: "users/login", method: .post, parameters: [
            "login" : login,
            "password" : password
        ], headers: headers)
        return try JSONDecoder().decode(ServerResponseModel.self, from: data)
    }
    

    public func register(email: String, password: String, name: String, telegram: String) async throws -> ServerResponseModel {
        let data = try await network.execute(path: "users/register", method: .post, parameters: [
            "email" : email,
            "password" : password,
            "name" : name,
            "telegram" : telegram
        ], headers: headers)
        return try JSONDecoder().decode(ServerResponseModel.self, from: data)
    }
    
    public func getPromo() async throws -> [ServerResponsePromoModel] {
        let data = try await AF.request("https://api.thecatapi.com/v1/images/search?limit=2", method: .get, encoding: JSONEncoding.default, headers: [.authorization("live_514mGzoewnW2Gt3Rb74otRFU4OJwcXfXFzEK2MPvxTzvAarIVPWIVakEaJyy3j4L")]).serializingData().value
            return try JSONDecoder().decode([ServerResponsePromoModel].self, from: data)
    }
    
}
