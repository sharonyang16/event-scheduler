//
//  ContentView.swift
//  event-scheduler
//
//  Created by Sharon Yang on 2/3/26.
//

import SwiftUI

struct ContentView: View {
    @Binding var document: event_schedulerDocument
    @StateObject var session = AuthSession()
    
    var body: some View {
        if session.isLoggedIn {
            MainTabView().environmentObject(session)
        }
        else {
            AuthenticationWrapperView(session: session)
        }
   
    } 
}

#Preview {
    ContentView(document: .constant(event_schedulerDocument()))
}
