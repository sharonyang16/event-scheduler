//
//  SignUpView.swift
//  event-scheduler
//
//  Created by Sharon Yang on 2/24/26.
//

import SwiftUI

struct SignUpView : View {
    @EnvironmentObject var session : AuthSession
    
    var body: some View {
        VStack {
            HStack {
                Text("Already have an account? Log in")
                NavigationLink{
                    LoginView()
                } label: {
                    Text("here")
                }
            }
         
        }.navigationBarBackButtonHidden(true).padding(30)
     
    }
}
