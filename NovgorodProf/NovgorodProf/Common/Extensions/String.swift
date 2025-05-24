//
//  String.swift
//  NovgorodProf
//
//  Created by Виталий Багаутдинов on 22.05.2025.
//

import Foundation

extension String {
    
    func validateEmail(_ email: String) -> Bool {
        let emailRegex = "[a-z0-9]+@[a-z0-9]+\\.[a-z]{2,64}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        
        return predicate.evaluate(with: email)
    }
    
}
