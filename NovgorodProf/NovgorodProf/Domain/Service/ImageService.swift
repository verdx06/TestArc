//
//  ImageService.swift
//  NovgorodProf
//
//  Created by Виталий Багаутдинов on 22.05.2025.
//

import Foundation

final class ImageService: ImageServiceProtocol {
    
    let data: ImageRepositoryProtocol
    
    init(data: ImageRepositoryProtocol) {
        self.data = data
    }
    
    func loadPromo() async throws -> [PromoModel] {
        
        return try await data.loadPromo()
        
    }
    
    
}
