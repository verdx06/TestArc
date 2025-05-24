//
//  TelegramModel.swift
//  NovgorodProf
//
//  Created by Виталий Багаутдинов on 24.05.2025.
//

import Foundation
import NetworkApi

struct TelegramModel: Decodable {
    let ok: Bool
    let result: Result?
    let error: String?
    
    struct Result: Decodable{
        let phone_number: String
    }
    
}

extension TelegramModel {
    init(from serverModel: ServerTelegramModel) {
        self.ok = serverModel.ok
        self.error = serverModel.error
        self.result = serverModel.result.map { serverResult in
            TelegramModel.Result(phone_number: serverResult.phone_number)
        }
    }
}
