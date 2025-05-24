//
//  File.swift
//  NetworkApi
//
//  Created by Виталий Багаутдинов on 24.05.2025.
//

import Foundation

public protocol NetworkTelegramApiProtocol {
    func sendCode(phone: String, code: Int) async throws -> ServerTelegramModel
}
