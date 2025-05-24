//
//  File.swift
//  NetworkApi
//
//  Created by Виталий Багаутдинов on 24.05.2025.
//

import Foundation
import Alamofire

public struct ContstantsTelegram {
    public static let telegramUrl = "https://gatewayapi.telegram.org"
    static let telegramToken = "AAEbGgAArAJKbV__XFGpSVDPgGscQrn5LN3sT6SdaTf_GA"
}

public final class NetworkTelegramApi: NetworkTelegramApiProtocol {
    
    let network: NetworkRequest
    
    public init(network: NetworkRequest) {
        self.network = network
    }
    
    let headers: HTTPHeaders = [
        .contentType("application/json"),
        .accept("application/json"),
        .authorization(bearerToken: ContstantsTelegram.telegramToken)
    ]
    
    public func sendCode(phone: String, code: Int) async throws -> ServerTelegramModel {
        let data = try await network.execute(path: "sendVerificationMessage", method: .post, parameters: [
            "phone_number": phone,
            "code" : code
        ], headers: headers)
        return try JSONDecoder().decode(ServerTelegramModel.self, from: data)
    }
    
}
