//
//  AuthSession.swift
//  event-scheduler
//
//  Created by Sharon Yang on 2/25/26.
//

import Foundation
import Combine

protocol TokenProvider {
    var token: String? { get }
}

protocol SessionManager {
    func logout()
}


@MainActor
class AuthSession: ObservableObject, TokenProvider, SessionManager {
    @Published var isLoggedIn: Bool = false
    @Published var token: String? = nil
    
    init() {
        let token: String? = KeychainManager.get(key: "authToken")
        
        if token != nil {
            self.token = token
            self.isLoggedIn = true
        }
    }
  
    func setToken(token: String) -> Void  {
        KeychainManager.set(value: token, key: "authToken")
        self.token = token
        self.isLoggedIn = true
    }
    
    func logout() -> Void  {
        KeychainManager.delete(key: "authToken")
        self.token = nil
        self.isLoggedIn = false
    }
}
