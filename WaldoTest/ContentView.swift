//
//  ContentView.swift
//  WaldoTest
//
//  Created by Dmytro Baida on 18.02.2021.
//

import SwiftUI
import AsyncImage

struct ContentView: View {
    
    @EnvironmentObject var state: AppState
    
    var body: some View {
        
        List {
            ForEach(state.imageURLs, id: \.self) {
                if let url = URL(string: $0) {
                    AsyncImage(url) {
                        ProgressView()
                    } activityIndicator: {
                        ProgressView()
                    }

                } else {
                    Text("Incorrect URL: \($0)")
                }
            }
            ProgressView()
                .onAppear {
                    state.didScrollToEnd()
                }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
