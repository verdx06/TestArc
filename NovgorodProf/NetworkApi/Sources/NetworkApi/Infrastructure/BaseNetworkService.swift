//
//  File.swift
//  NetworkApi
//
//  Created by Виталий Багаутдинов on 21.05.2025.
//

import Foundation
import Alamofire

public final class BaseNetworkService: NetworkRequest {
    public var baseURL: String?
    
    public init() {}
    
    public func execute(path: String, method: HTTPMethod, parameters: Parameters) async throws -> Data {
        guard let baseURL = baseURL else {
            fatalError("Error base url")
        }
        
        let headers: HTTPHeaders = [
            .contentType("application/json"),
            .accept("application/json"),
            .authorization("3101047D-6DD7-45C2-983A-F9C574510CA4")
        ]
        
        let stringURL = baseURL + "/" + path
        
        let data = try await AF.request(stringURL, method: method, parameters: parameters, encoding: JSONEncoding.default, headers: headers).serializingData().value
        
        print(data)
        
        return data
        
    }
    
    public func configure(baseURL: String) {
        self.baseURL = baseURL
    }
    
    
}
