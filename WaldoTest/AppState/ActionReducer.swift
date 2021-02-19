//
//  AppActionReducer.swift
//  WaldoTest
//
//  Created by Dmytro Baida on 19.02.2021.
//

import Foundation
import ReSwift

func appReducer(action: Action, state: AppState? ) -> AppState {
    var newState = state ?? AppState()
    
    switch action {
    
    case let usr as UserAction:
        switch usr {

        case .setEmail(let email):
            newState.email = email
            
        case .setPassword(let password):
            newState.password = password
        }
        
    case let app as AppAction:
        switch app {
        case .addPhotos(let album, offset: let offset, count: let count):
            
            let bestSizedThumbnails = album.photos.records.compactMap {
                $0.thumbnail_urls.sorted { $0.size_code.rawValue < $1.size_code.rawValue } .first?.url
            }
            
            newState.imageURLs.insert(contentsOf: bestSizedThumbnails, at: offset)
            
        case .setAuth(let token):
            newState.jwtToken = token
            
        }

    default:
        break
    }

    return newState
}

