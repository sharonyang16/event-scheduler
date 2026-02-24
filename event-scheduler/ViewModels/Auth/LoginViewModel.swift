//
//  LoginViewModel.swift
//  event-scheduler
//
//  Created by Sharon Yang on 2/24/26.
//

import Foundation
import Combine

@MainActor
class LoginViewModel : ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""
    
    func onSubmit() -> Void {
        print("hi")
    }
}
