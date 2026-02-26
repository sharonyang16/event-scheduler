//
//  ProfileView.swift
//  event-scheduler
//
//  Created by Sharon Yang on 2/24/26.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var authSession: AuthSession
    
    var body: some View {
        VStack {
            Text("my")
            Button {
                Task {
                    authSession.logout()
                }
            } label: {
                Text("Log out")
            }
       
        }
  
    }
}
