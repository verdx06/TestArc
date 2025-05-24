//
//  NetworkTelegramAssembly.swift
//  NovgorodProf
//
//  Created by Виталий Багаутдинов on 24.05.2025.
//

import Foundation
import NetworkApi

final class NetworkTelegramAssembly {
    
    private static func networkRequest() -> BaseNetworkService {
        let service = BaseNetworkService()
        service.configure(baseURL: ContstantsTelegram.telegramUrl)
        return service
    }
    
    static let network = NetworkTelegramApi(network: networkRequest())
    
}

