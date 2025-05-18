//
//  CharacterUseCase.swift
//  TestClean
//
//  Created by Виталий Багаутдинов on 18.05.2025.
//

import Foundation

protocol CharacterUseCase {
    
    func fetchPost() async throws -> [PostModel]
    
}
