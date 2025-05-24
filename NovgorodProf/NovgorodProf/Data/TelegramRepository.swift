//
//  TelegramRepository.swift
//  NovgorodProf
//
//  Created by Виталий Багаутдинов on 24.05.2025.
//

import Foundation
import NetworkApi

final class TelegramRepository: TelegramRepositoryProtocol {
    
    let network: NetworkTelegramApiProtocol
    
    init(network: NetworkTelegramApiProtocol) {
        self.network = network
    }
    
    func sendCode(phone: String, code: Int) async throws -> TelegramModel {
        let result = try await network.sendCode(phone: phone, code: code)
        return TelegramModel.init(from: result)
    }
    
    
}
