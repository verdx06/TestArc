//
//  ImageRepository.swift
//  NovgorodProf
//
//  Created by Виталий Багаутдинов on 22.05.2025.
//

import Foundation
import NetworkApi

final class ImageRepository: ImageRepositoryProtocol {
    
    let network: NetworkBaseApi
    
    init(network: NetworkBaseApi) {
        self.network = network
    }
    
    func getPromo() async throws -> [PromoModel] {
        if let promo = UserDefaults.standard.stringArray(forKey: "promo") {
            print("Кэш был бро")
            return promo.map { PromoModel(url: $0) }
        } else {
            print("Кэша не было сука!!!!")
            let result = try await network.getPromo()
            let urlString = result.map { $0.url }
            UserDefaults.standard.set(urlString, forKey: "promo")
            return try result.map { try PromoModel(from: $0) }
        }
    }
    
    
}
