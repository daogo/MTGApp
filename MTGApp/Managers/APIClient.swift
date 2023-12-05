//
//  APIClient.swift
//  MTGApp
//
//  Created by Dawid Ogonowski on 01/12/2023.
//

import Foundation


enum APIEndpoint {
    case cards

    var endpoint: String {
        switch self {
        case .cards:
            return "/cards"
        }
    }
}

class APIClient {
    static let baseURL = "https://api.magicthegathering.io/v1"


    static func fetchData<T: Decodable>(endpoint: APIEndpoint) async throws -> T {
        guard let url = URL(string: baseURL + endpoint.endpoint) else {
            throw MTGError.invalidUrl(baseURL + endpoint.endpoint)
        }

        let (data, _) = try await URLSession.shared.data(from: url)


        let decodedData = try JSONDecoder().decode(T.self, from: data)
        return decodedData
    }


}
