//
//  LoginViewModel.swift
//  NovgorodProf
//
//  Created by Виталий Багаутдинов on 20.05.2025.
//

import Foundation

final class LoginViewModel: ObservableObject {
    
    private let domain: CharacterServiceProtocol
    
    init(domain: CharacterServiceProtocol) {
        self.domain = domain
    }
    
    @Published var user: UserModel?
    
    @Published var email: String = ""
    @Published var password: String = ""
    
    @Published var emailError: String = ""
    @Published var passwordError: String = ""
    
    @Published var isNavigate: Bool = false
    @Published var isProgress: Bool = false
    
    func login() {
        Task {
            do {
                await MainActor.run {
                    self.isNavigate = false
                    self.isProgress = true
                }
                let user = try await domain.login(login: email, password: password)
                await MainActor.run {
                    self.user = user
                    UserDefaults.standard.set(user.name, forKey: "name")
                    UserDefaults.standard.set(user.email, forKey: "email")
                    UserDefaults.standard.set(user.telegram, forKey: "telegram")
                    self.isNavigate = true
                    self.isProgress = false
                }
            } catch {
                print(error.localizedDescription)
                await MainActor.run {
                    self.isNavigate = false
                    self.isProgress = false
                }
            }
        }
    }
    
    func checkPassword() -> Bool {
        return domain.checkValidPassword(password)
    }
    
    func activeButton() -> Bool {
        return !email.isEmpty && !password.isEmpty
    }
    
    func checkError() -> Bool {
        
        emailError = email.validateEmail(email) ? "" : "Email некорректный"
        passwordError = checkPassword() ? "" : "Пароль некорректный"
        
        return emailError.isEmpty || passwordError.isEmpty
        
    }
    
}
