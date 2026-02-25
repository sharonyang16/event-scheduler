//
//  APIError.swift
//  event-scheduler
//
//  Created by Sharon Yang on 2/24/26.
//

import Foundation

enum APIError: LocalizedError {
    case badURL
    case badResponse(Int, String)
    case decodingError

    var errorDescription: String? {
        switch self {
            case .badURL: return "Invalid URL"
            case .badResponse(let code, let message): return "Server error: \(code) \(message)"
            case .decodingError: return "Failed to decode response"
        }
    }
}
