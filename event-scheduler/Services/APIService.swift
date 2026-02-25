//
//  APIService.swift
//  event-scheduler
//
//  Created by Sharon Yang on 2/24/26.
//

import Foundation
import WebKit

class APIService {
    struct ErrorResponse : Codable {
        let message: String
    }
    
    static let baseURL: String? = Bundle.main.object(forInfoDictionaryKey: "APIBaseURL") as? String

    static func request<T: Codable>(
        endpoint: String,
        method: String = "GET",
        body: Encodable? = nil,
        token: String? = nil
    ) async throws -> T {
        print("\(baseURL ?? "")\(endpoint)")
        
        guard let url = URL(string: "\(baseURL ?? "")\(endpoint)") else {
            print(baseURL as Any)
            throw APIError.badURL
        }

        var request = URLRequest(url: url)
        request.httpMethod = method
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        if let token {
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }

        if let body {
            request.httpBody = try JSONEncoder().encode(body)
        }

        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw APIError.badResponse(0, "Invalid response")
        }

        if !(200...201).contains(httpResponse.statusCode) {
            let message = (try? JSONDecoder().decode(ErrorResponse.self, from: data))?.message
                ?? "Something went wrong"

            throw APIError.badResponse(httpResponse.statusCode, message)
        }

        return try JSONDecoder().decode(T.self, from: data)
    }
}
