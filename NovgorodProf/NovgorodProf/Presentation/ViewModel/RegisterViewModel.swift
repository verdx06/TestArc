//
//  RegisterViewModel.swift
//  NovgorodProf
//
//  Created by Виталий Багаутдинов on 24.05.2025.
//

import Foundation

final class RegisterViewModel: ObservableObject {
    
    let domain: CharacterServiceProtocol
    
    init(domain: CharacterServiceProtocol = AuthorizateAssembly.useCase()) {
        self.domain = domain
    }
    
    @Published var user: UserModel?
    
    @Published var firstName: String = "123456"
    @Published var secondName: String = "12345"
    @Published var phone: String = "89955743а040"
    @Published var birthday: String = "12345"
    @Published var gender: String = "male"
    @Published var telegram: String = "@male"
    
    @Published var email: String = "test@gmail.com"
    @Published var password: String = "12345678"
    @Published var confirmpassword: String = "12345678"
    
    
    @Published var isCode: Bool = false
    @Published var isNavigate: Bool = false
    @Published var isProgress: Bool = false
    
    func register() {
        Task {
            do {
                isNavigate = false
                isProgress = true
                user = try await domain.register(email: email, password: password, name: (secondName + " " + firstName), telegram: telegram)
                isNavigate = true
                isProgress = false
            } catch {
                isNavigate = false
                isProgress = false
                print("Register " + error.localizedDescription)
            }
        }
    }
    
    func activeButton() -> Bool {
        
        return !firstName.isEmpty && !secondName.isEmpty && !phone.isEmpty && !birthday.isEmpty && !gender.isEmpty && !telegram.isEmpty
        
    }
    
}
