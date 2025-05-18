//
//  File.swift
//  NetworkApi
//
//  Created by Виталий Багаутдинов on 18.05.2025.
//

import Foundation
import Alamofire

public final class BaseNetworkService: Network {
    
    public var baseUrl: String?
    
    public init() {
    }
    
    public func execute(path: String, method: HTTPMethod = .get, params: [String : String]? = nil) async throws -> Data {
        guard let baseUrl = baseUrl else {
            print("FatalError")
            fatalError()
        }
        
        let headers: HTTPHeaders = [
            .accept("application/json"),
            .contentType("application/json")
        ]
        
        let stringUrl = baseUrl + "/" + path
        
            if #available(iOS 13, *) {
                return try await AF.request(stringUrl, method: method, parameters: params, encoding: JSONEncoding.default, headers: headers).serializingData().value
        } else {
            return Data(count: 2)
        }
        
        
        
    }
    
    public func configute(baseURL: String) {
        self.baseUrl = baseURL
    }
    
    
}
