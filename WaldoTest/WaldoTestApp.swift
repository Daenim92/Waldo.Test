//
//  WaldoTestApp.swift
//  WaldoTest
//
//  Created by Dmytro Baida on 18.02.2021.
//

import SwiftUI
import ReSwift
import ReSwiftThunk

@main
struct WaldoTestApp: App {
    
    @StateObject var store: StoreWrapper = {
        
        let initState = AppState()
        let store = Store(reducer: appReducer, state: initState,
                          middleware: [createThunkMiddleware()])
        
        let wrapper = StoreWrapper(store)
        
        return wrapper
    }()
    
    
    var body: some Scene {
        WindowGroup {
            
            if let _ = store.state.jwtToken {
                ContentView()
                    .environmentObject(store)
            } else {
                LoginView()
                    .environmentObject(store)
            }

        }
    }
}
