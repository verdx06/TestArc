//
//  LoginViewModel.swift
//  NovgorodProf
//
//  Created by Виталий Багаутдинов on 20.05.2025.
//

import Foundation

final class LoginViewModel: ObservableObject {
    
    private let domain: AuthorizateProtocol
    
    init(domain: AuthorizateProtocol) {
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
        let count = password.count >= 8
        let number = password.contains { $0.isNumber }
        let upper = password.contains { $0.isUppercase }
        let low = password.contains { $0.isLowercase }
        let symb = password.rangeOfCharacter(from: .symbols) != nil || password.rangeOfCharacter(from: .punctuationCharacters) != nil
        
        return count && number && upper && low && symb
    }
    
    func activeButton() -> Bool {
        return !email.isEmpty && !password.isEmpty
    }
    
    func checkError() -> Bool {
        
        emailError = EmailValidate.emailValidate(email) ? "" : "Email некорректный"
        passwordError = checkPassword() ? "" : "Пароль некорректный"
        
        return emailError.isEmpty || passwordError.isEmpty
        
    }
    
}
