//
//  AuthenticationWrapperView.swift
//  event-scheduler
//
//  Created by Sharon Yang on 2/24/26.
//

import SwiftUI

struct AuthenticationWrapperView : View {
    @StateObject private var authViewModel: AuthViewModel
    
    init(session: AuthSession) {
        self._authViewModel = StateObject(wrappedValue: AuthViewModel(session: session))
    }
    
    var body: some View {
        NavigationStack {
            LoginView()
        }.environmentObject(authViewModel)
    }
}
