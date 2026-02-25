//
//  AuthService.swift
//  event-scheduler
//
//  Created by Sharon Yang on 2/24/26.
//

class AuthService {
    struct SignUpRequest: Codable {
        let email: String
        let password: String
        let firstName: String
        let lastName: String
    }
    
    struct LoginRequest: Codable {
        let email: String
        let password: String
    }
    
    struct AuthResponse : Codable {
        let token: String
    }
    
    static func login(email: String, password: String) async throws -> AuthResponse {
        try await APIService.request(
                  endpoint: "/auth/login",
                  method: "POST",
                  body: LoginRequest(email: email, password: password)
              )
    }
    
    static func signUp(email: String, password: String, firstName: String, lastName: String) async throws -> AuthResponse {
        try await APIService.request(
                  endpoint: "/auth/sign-up",
                  method: "POST",
                  body: SignUpRequest(email: email, password: password, firstName: firstName, lastName: lastName)
              )
    }
    
}
