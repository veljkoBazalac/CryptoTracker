//
//  CryptoTrackerApp.swift
//  CryptoTracker
//
//  Created by VELJKO on 9.11.22..
//

import SwiftUI

@main
struct CryptoTrackerApp: App {
    
    @StateObject private var homeViewModel = HomeViewModel()
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor : UIColor(Color.theme.accent)]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor : UIColor(Color.theme.accent)]
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .navigationBarHidden(true)
                    .navigationBarTitleDisplayMode(.large)
            }
            .environmentObject(homeViewModel)
        }
    }
}
