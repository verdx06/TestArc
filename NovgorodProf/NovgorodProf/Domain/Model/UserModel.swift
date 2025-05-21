//
//  UserModel.swift
//  NovgorodProf
//
//  Created by Виталий Багаутдинов on 21.05.2025.
//

import Foundation
import NetworkApi

struct UserModel: Decodable {
    let email: String
    let name: String?
    let telegram: String?
}

extension UserModel {
    init(from response: ServerResponseModel) throws {
        self.email = response.email
        self.name = response.name
        self.telegram = response.telegram
    }
}
