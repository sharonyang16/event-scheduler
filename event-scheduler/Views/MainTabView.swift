//
//  TabView.swift
//  event-scheduler
//
//  Created by Sharon Yang on 2/24/26.
//

import SwiftUI

struct MainTabView: View {
    @EnvironmentObject var authViewModel : AuthViewModel
    
    var body: some View {
        TabView {
            HomeView().tabItem{
                Label("Home", systemImage: "house")
            }
            ProfileView().tabItem{
                Label("Profile", systemImage: "person")
            }
            
        }
    }
}
