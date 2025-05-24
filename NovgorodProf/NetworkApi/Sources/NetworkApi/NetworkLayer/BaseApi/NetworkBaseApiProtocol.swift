//
//  File.swift
//  NetworkApi
//
//  Created by Виталий Багаутдинов on 21.05.2025.
//

import Foundation

public protocol NetworkBaseApiProtocol {
    func login(login: String, password: String) async throws -> ServerResponseModel
    func register(email: String, password: String, name: String, telegram: String) async throws -> ServerResponseModel
    func getPromo() async throws -> [ServerResponsePromoModel]
}
