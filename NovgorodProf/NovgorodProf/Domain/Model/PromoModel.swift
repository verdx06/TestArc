//
//  PromoModel.swift
//  NovgorodProf
//
//  Created by Виталий Багаутдинов on 22.05.2025.
//

import Foundation
import NetworkApi

struct PromoModel: Decodable, Hashable {
    let url: String
}

extension PromoModel {
    init(from decoder: ServerResponsePromoModel) throws {
        self.url = decoder.url
    }
}
