//
//  SignUpView.swift
//  event-scheduler
//
//  Created by Sharon Yang on 2/24/26.
//

import SwiftUI

struct SignUpView : View {
    var body: some View {
        VStack {
            NavigationLink{
                LoginView()
            } label: {
                Text("here")
            }
        }.navigationBarBackButtonHidden(true)
     
    }
}
