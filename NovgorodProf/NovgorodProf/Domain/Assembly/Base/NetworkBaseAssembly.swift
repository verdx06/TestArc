//
//  NetworkAssembly.swift
//  NovgorodProf
//
//  Created by Виталий Багаутдинов on 23.05.2025.
//

import Foundation
import NetworkApi

final class NetworkBaseAssembly {
    
    
    private static func networkRequest() -> BaseNetworkService {
        let service = BaseNetworkService()
        service.configure(baseURL: ConstantsBase.baseURL)
        return service
    }
    
    static let network = NetworkBaseApi(network: networkRequest())
    
}
