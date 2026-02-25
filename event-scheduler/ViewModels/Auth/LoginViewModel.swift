//
//  LoginViewModel.swift
//  event-scheduler
//
//  Created by Sharon Yang on 2/24/26.
//

import Foundation
import Combine

@MainActor
class LoginViewModel : ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var error: String? = nil
    @Published var isLoading: Bool = false
    
    func login() async {
        if !areFieldsValid() {
            error = "Email and password are required."
            return
        }
        isLoading = true
        do {
            let response  = try await AuthService.login(email: self.email, password: self.password)
            print(response.token)
        } catch {
            self.error = error.localizedDescription
        }
        isLoading = false
    }
    
    private func areFieldsValid() -> Bool {
        !self.email.isEmpty && !self.password.isEmpty
    }
}
