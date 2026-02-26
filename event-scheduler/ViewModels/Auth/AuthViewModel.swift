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
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var isLoading: Bool = false
    @Published var error: String? = nil
    
    private let session: AuthSession
    
    init(session: AuthSession) {
        self.session = session
    }
    
    func signUp() async {
        if !self.isSignUpFieldsValid() {
            error = "Please fill in all the fields"
            return
        }
        
        error = nil
        isLoading = true
        do {
            let response  = try await AuthService.signUp(
                email: self.email,
                password: self.password,
                firstName: self.firstName,
                lastName: self.lastName)
            
            self.session.setToken(token: response.token)
            print(response.token)
        } catch {
            self.error = error.localizedDescription
        }
        isLoading = false
    }
    
    func login() async {
        if !self.isLoginFieldsValid( ) {
            error = "Please fill in all the fields"
            return
        }
        
        error = nil
        isLoading = true
        do {
            let response  = try await AuthService.login(
                email: self.email,
                password: self.password)
            
            self.session.setToken(token: response.token)
            print(response.token)
        } catch {
            self.error = error.localizedDescription
        }
        isLoading = false
    }
    
    private func isSignUpFieldsValid() -> Bool {
        return !email.isEmpty && !password.isEmpty && !firstName.isEmpty && !lastName.isEmpty
    }
    
    private func isLoginFieldsValid() -> Bool {
        return !email.isEmpty && !password.isEmpty
    }
    
    
}
