//
//  ImageRepositoryProtocol.swift
//  NovgorodProf
//
//  Created by Виталий Багаутдинов on 22.05.2025.
//

import Foundation

protocol ImageRepositoryProtocol {
    func getPromo() async throws -> [PromoModel]
}
