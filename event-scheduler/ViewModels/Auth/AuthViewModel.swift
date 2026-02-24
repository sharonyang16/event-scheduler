//
//  AuthViewModel.swift
//  event-scheduler
//
//  Created by Sharon Yang on 2/24/26.
//

import Foundation
import Combine

@MainActor
class AuthViewModel : ObservableObject {
    @Published var isLoggedIn: Bool = true
    @Published var token: String?
    
    init() {
        // check if theres a saved token
        // token = saved token
        // isLoggedIn = true
    }
    
    func setToken(token: String) -> Void  {
        self.token = token
        self.isLoggedIn = true
    }
    
    func logout() -> Void  {
        self.token = nil
        self.isLoggedIn = false
    }
    
}
