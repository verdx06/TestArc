//
//  RegisterViewModel.swift
//  NovgorodProf
//
//  Created by Виталий Багаутдинов on 20.05.2025.
//

import Foundation

final class RegisterViewModel: ObservableObject {
    
    private let domain: AuthorizateProtocol
    
    init(domain: AuthorizateProtocol) {
        self.domain = domain
    }
    
    @Published var user: UserModel?
    
    @Published var firstName: String = ""
    @Published var secondName: String = ""
    @Published var BatyaName: String = ""
    @Published var birthday: String = ""
    @Published var gender: String = ""
    @Published var telegram: String = ""
    
    @Published var email: String = "test@gmail.com"
    @Published var password: String = "12345678"
    @Published var confirmpassword: String = "12345678"
    
    
    @Published var isCode: Bool = false
    @Published var isNavigate: Bool = false
    @Published var isProgress: Bool = false
    
    func register() {
        Task {
            do {
                await MainActor.run {
                    self.isNavigate = false
                    self.isProgress = true
                }
                let user = try await domain.register(email: email, password: password, name: (secondName + " " + firstName + " " + BatyaName), telegram: telegram)
                await MainActor.run {
                    self.user = user
                    self.isNavigate = true
                    self.isProgress = false
                }
            } catch {
                await MainActor.run {
                    self.isNavigate = false
                    self.isProgress = false
                }
                print("Register " + error.localizedDescription)
            }
        }
    }
    
    func activeButton() -> Bool {
        
        return !firstName.isEmpty && !secondName.isEmpty && !BatyaName.isEmpty && !birthday.isEmpty && !gender.isEmpty && !telegram.isEmpty
    }
    

    
}
