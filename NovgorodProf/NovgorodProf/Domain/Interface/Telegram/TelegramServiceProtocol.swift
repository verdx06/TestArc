//
//  TelegramServiceProtocol.swift
//  NovgorodProf
//
//  Created by Виталий Багаутдинов on 24.05.2025.
//

import Foundation

protocol TelegramServiceProtocol {
    func sendCode(phone: String, code: Int) async throws -> TelegramModel
}
