//
//  ContentView.swift
//  event-scheduler
//
//  Created by Sharon Yang on 2/3/26.
//

import SwiftUI

struct ContentView: View {
    @Binding var document: event_schedulerDocument
    @StateObject var viewModel = AuthViewModel()
    
    var body: some View {
        if viewModel.isLoggedIn {
            MainTabView().environmentObject(viewModel)
        }
        else {
            LoginView().environmentObject(viewModel)
        }
           
   
    } 
}

#Preview {
    ContentView(document: .constant(event_schedulerDocument()))
}
