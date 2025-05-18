//
//  File.swift
//  NetworkApi
//
//  Created by Виталий Багаутдинов on 18.05.2025.
//

import Foundation

public struct ServerInfoModel: Decodable{
    public let userId: Int?
    public let id: Int?
    public let title: String?
    public let body: String?
}
