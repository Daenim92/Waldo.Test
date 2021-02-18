//
//  WaldoTestApp.swift
//  WaldoTest
//
//  Created by Dmytro Baida on 18.02.2021.
//

import SwiftUI

@main
struct WaldoTestApp: App {
    
    @StateObject var state = AppState()
    
    var body: some Scene {
        WindowGroup {
            
            if let _ = state.jwtToken {
                ContentView()
                    .environmentObject(state)
            } else {
                LoginView()
                    .environmentObject(state)
            }

        }
    }
}
