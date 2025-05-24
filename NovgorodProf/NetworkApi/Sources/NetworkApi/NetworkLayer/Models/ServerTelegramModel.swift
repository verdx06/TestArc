//
//  File.swift
//  NetworkApi
//
//  Created by Виталий Багаутдинов on 24.05.2025.
//

import Foundation
//
//{"ok":true,
// "result":
//    {"request_id":"167255467602212",
//        "phone_number":"79955749040",
//        "request_cost":0,
//        "remaining_balance":0,
//        "delivery_status":
//        {"status":
//            "sent",
//            "updated_at":1748073287
//        }
//    }
//}

//{"ok":false,
//    "error":"PHONE_NUMBER_INVALID"
//}

public struct ServerTelegramModel: Decodable {
    public let ok: Bool
    public let result: Result?
    public let error: String?
    
    public struct Result: Decodable {
        public let phone_number: String
    }
}
