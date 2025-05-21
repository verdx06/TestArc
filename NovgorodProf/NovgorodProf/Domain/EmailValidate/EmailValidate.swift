//
//  EmailValidate.swift
//  NovgorodProf
//
//  Created by Виталий Багаутдинов on 20.05.2025.
//

import Foundation

class EmailValidate: EmailProtocol {
    private static let emailRegex = "[a-z0-9]+@[a-z0-9]+\\.[a-z]{2,64}"
    
    static func emailValidate(_ email: String) -> Bool {
        let predicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        
        return predicate.evaluate(with: email)
    }
    
}
