//
//  AppAction.swift
//  WaldoTest
//
//  Created by Dmytro Baida on 19.02.2021.
//

import Foundation
import ReSwift

enum UserAction: Action {
    
    case setEmail(String)
    case setPassword(String)
    
}

enum AppAction: Action {
    case addPhotos(Album, offset: Int, count: Int)
    case setAuth(String?)
}
