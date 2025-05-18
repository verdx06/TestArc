// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

public struct Constants {
    public static let baseURL = "https://jsonplaceholder.typicode.com"
}

public final class NetworkApi {
    
    private let network: Network
    
    public init(network: Network) {
        self.network = network
    }
    
    public func getPosts() async throws -> [ServerInfoModel] {
        let data = try await network.execute(path: "posts", method: .get, params: nil)
        print(data)
        return try JSONDecoder().decode([ServerInfoModel].self, from: data)
    }
    
}
