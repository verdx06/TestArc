//
//  AuthorizateProtocol.swift
//  NovgorodProf
//
//  Created by Виталий Багаутдинов on 21.05.2025.
//

import Foundation

protocol CharacterServiceProtocol {
    func login(login: String, password: String) async throws -> UserModel
    func register(email: String, password: String, name: String, telegram: String) async throws -> UserModel
    func checkValidPassword(_ password: String) -> Bool
}
