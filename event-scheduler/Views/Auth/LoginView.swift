//
//  LoginView.swift
//  event-scheduler
//
//  Created by Sharon Yang on 2/24/26.
//

import SwiftUI

struct LoginView : View {
    @EnvironmentObject var vm : AuthViewModel
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Log In").font(Font.largeTitle.bold())
            
            if vm.error?.isEmpty == false {
                Text(vm.error ?? "An unknown error occured.")
            }
            
            TextField("Email", text: $vm.email)
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
                .keyboardType(.emailAddress)
                .textContentType(.username)
                .border(Color(.secondarySystemBackground))
            
            SecureField("Password", text: $vm.password)
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
                .textContentType(.password)
                .border(Color(.secondarySystemBackground))
                
            Button {
                Task {
                    await vm.login()
                }
            } label: {
                Text("Log In")
            }.buttonStyle(.glassProminent)
    
            HStack {
                Text("Don't have an account? Sign up")
                NavigationLink{
                    SignUpView()
                } label: {
                    Text("here")
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .padding(30)
    }
}
