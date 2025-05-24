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
    
    public func execute(path: String, method: HTTPMethod, parameters: Parameters, headers: HTTPHeaders) async throws -> Data {
        guard let baseURL = baseURL else {
            fatalError("Error base url")
        }
        
        let stringURL = baseURL + "/" + path
        
        let data = try await AF.request(stringURL, method: method, parameters: parameters, encoding: JSONEncoding.default, headers: headers).serializingData().value
        
        print(String(data: data, encoding: .utf8) ?? "nothing")
        
        return data
        
    }
    
    public func configure(baseURL: String) {
        self.baseURL = baseURL
    }
    
    
}
