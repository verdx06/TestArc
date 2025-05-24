//
//  AuthorizateRepositoryProtocol.swift
//  NovgorodProf
//
//  Created by Виталий Багаутдинов on 21.05.2025.
//

import Foundation

protocol AuthorizateRepositoryProtocol {
    func login(login: String, password: String) async throws -> UserModel
    func register(email: String, password: String, name: String, telegram: String) async throws -> UserModel
}

//{
//    "___class" = Users;
//    accountType = "<null>";
//    blUserLocale = en;
//    created = 1747821441561;
//    email = "use2r@example.com";
//    lastLogin = "<null>";
//    name = "<null>";
//    oAuthIdentities = "<null>";
//    objectId = "66821790-6064-4102-8A9F-8ABCC61F6B76";
//    ownerId = "66821790-6064-4102-8A9F-8ABCC61F6B76";
//    socialAccount = "<null>";
//    updated = "<null>";
//    userStatus = ENABLED;
//}
