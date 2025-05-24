//
//  ProfileViewModel.swift
//  NovgorodProf
//
//  Created by Виталий Багаутдинов on 22.05.2025.
//

import Foundation
import Kingfisher

@MainActor
final class ProfileViewModel: ObservableObject {
    
    @Published var images: [PromoModel] = []
    @Published var isLoading: Bool = false
    @Published var textSearch: String = ""
    let category: [String] = ["Популярное", "Мужское", "Женское"]
    
    let domain: ImageServiceProtocol
    
    init(domain: ImageServiceProtocol) {
        self.domain = domain
    }
    
    func loadPromo() {
        Task {
            do {
                self.images = try await domain.getPromo()
            } catch {
                print(error.localizedDescription)
            }
        }
        
    }
    
    
}
