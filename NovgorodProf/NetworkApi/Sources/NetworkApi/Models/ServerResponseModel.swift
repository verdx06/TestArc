//
//  File.swift
//  NetworkApi
//
//  Created by Виталий Багаутдинов on 21.05.2025.
//

import Foundation

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

public struct ServerResponseModel: Decodable {
    public let email: String
    public let name: String?
    public let telegram: String?
}
