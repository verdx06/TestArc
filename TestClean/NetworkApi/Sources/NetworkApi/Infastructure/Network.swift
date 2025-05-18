//
//  File.swift
//  NetworkApi
//
//  Created by Виталий Багаутдинов on 18.05.2025.
//

import Foundation
import Alamofire

public protocol Network {
    func execute(path: String, method: HTTPMethod, params: [String:String]?) async throws -> Data
    func configute(baseURL: String)
}
