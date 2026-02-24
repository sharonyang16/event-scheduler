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
            Text("Log In")
            TextField("Email", text: $viewModel.username).disableAutocorrection(true)
            
            SecureField("Password", text: $viewModel.password).disableAutocorrection(true)
            
            Button("Sign In", action: viewModel.onSubmit).buttonStyle(.borderedProminent)
            
            NavigationLink{
                SignUpView()
            } label: {
                Text("here")
            }
        }.navigationBarBackButtonHidden(true)
    }
}
