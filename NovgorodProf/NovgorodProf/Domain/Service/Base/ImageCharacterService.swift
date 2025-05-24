//
//  ImageCharacterService.swift
//  NovgorodProf
//
//  Created by Виталий Багаутдинов on 22.05.2025.
//

import Foundation

final class ImageCharacterService: ImageServiceProtocol {
    
    let data: ImageRepositoryProtocol
    
    init(data: ImageRepositoryProtocol) {
        self.data = data
    }
    
    func getPromo() async throws -> [PromoModel] {
        return try await data.getPromo()
    }
    
    
}
