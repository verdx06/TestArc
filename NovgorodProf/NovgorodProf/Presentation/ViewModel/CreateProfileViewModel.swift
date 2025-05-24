//
//  RegisterViewModel.swift
//  NovgorodProf
//
//  Created by Виталий Багаутдинов on 20.05.2025.
//

import Foundation

@MainActor
final class CreateProfileViewModel: ObservableObject {
    
    private let domain: TelegramServiceProtocol
    
    @Published var status: TelegramModel?
    @Published var error: String = ""
    
    init(domain: TelegramServiceProtocol = TelegramAssembly.useCase()) {
        self.domain = domain
    }
    
    @Published var isCode: Bool = false
    @Published var isProgress: Bool = false
    
    let code: Int = .random(in: 1000...9999)
    
    func sendCode(phone: String) {
        Task {
            do {
                isCode = false
                isProgress = true
                status = try await domain.sendCode(phone: phone, code: code)
                if status?.error != nil {
                    self.error = "Введите корректный номер телефона: +7XXXXXXXXXX"
                    isProgress = false
                } else {
                    self.error = ""
                    isCode = true
                    isProgress = false
                }
            } catch {
                isProgress = false
                print("error")
            }
        }
    }
}
