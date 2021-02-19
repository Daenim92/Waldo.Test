//
//  ContentView.swift
//  WaldoTest
//
//  Created by Dmytro Baida on 18.02.2021.
//

import SwiftUI
import AsyncImage

struct ContentView: View {
    
    @EnvironmentObject var store: StoreWrapper
    
    var body: some View {
        
        List {
            
            ForEach(store.state.imageURLs, id: \.self) {
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
                    store.dispatch(APIAction.getMorePhotos())
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
