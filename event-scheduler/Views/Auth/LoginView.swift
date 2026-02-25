//
//  LoginView.swift
//  event-scheduler
//
//  Created by Sharon Yang on 2/24/26.
//

import SwiftUI

struct LoginView : View {
    @EnvironmentObject var authViewModel : AuthViewModel
    @StateObject private var viewModel = LoginViewModel()
    
    var body: some View {
        VStack(spacing: 30) {
            if viewModel.error?.isEmpty == false {
                Text("Error: \(String(describing: viewModel.error))")
            }
            Text("Log In")
            TextField("Email", text: $viewModel.email).disableAutocorrection(true)
            
            SecureField("Password", text: $viewModel.password).disableAutocorrection(true)
            
            Button {
                Task {
                     await viewModel.login()
                 }
            } label: {
                Text("Log In")
            }
            
            
            NavigationLink{
                SignUpView()
            } label: {
                Text("here")
            }
        }.navigationBarBackButtonHidden(true)
    }
}
