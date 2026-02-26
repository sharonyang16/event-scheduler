//
//  SignUpView.swift
//  event-scheduler
//
//  Created by Sharon Yang on 2/24/26.
//

import SwiftUI

struct SignUpView : View {
    @EnvironmentObject var vm : AuthViewModel
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Register").font(Font.largeTitle.bold())
            
            if vm.error?.isEmpty == false {
                Banner(
                    message: vm.error ?? "An unknown error occured.",
                    type: .error
                )
            }
            
            HStack(spacing: 10) {
                TextField("First Name", text: $vm.firstName)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    .textContentType(.name)
                    .border(Color(.secondarySystemBackground))
                
                TextField("Last Name", text: $vm.lastName)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    .keyboardType(.emailAddress)
                    .textContentType(.familyName)
                    .border(Color(.secondarySystemBackground))
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
                    await vm.signUp()
                }
            } label: {
                Text("Sign Up")
            }.buttonStyle(.glassProminent)
            HStack {
                Text("Already have an account? Log in")
                NavigationLink{
                    LoginView().onAppear(perform: vm.resetStates)
                } label: {
                    Text("here")
                }
            }
         
        }
        .navigationBarBackButtonHidden(true)
        .padding(30)
     
    }
}
