//
//  File.swift
//  NetworkApi
//
//  Created by Виталий Багаутдинов on 21.05.2025.
//

import Foundation
import Alamofire

public protocol NetworkRequest {
    func execute(path: String, method: HTTPMethod, parameters: Parameters, headers: HTTPHeaders) async throws -> Data
    func configure(baseURL: String)
}
