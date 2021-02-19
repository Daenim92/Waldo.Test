//
//  WaldoTestModel.swift
//  WaldoTest
//
//  Created by Dmytro Baida on 18.02.2021.
//

import Foundation
import ReSwift

struct AppState: StateType {
    
    var imageURLs = [String]()

    //
        
    var jwtToken: String?
    
    var email: String = "thanos+ios+engineer@waldophotos.com"
    var password: String = "!!waldo123_"
    
    var albumID: String = "exHbvthJfbuFwiusSJuVAm"
    
    //
    
    let apiURL = URL(string: "https://core-graphql.dev.waldo.photos/gql")!

    let batchSize = 20
    
}
