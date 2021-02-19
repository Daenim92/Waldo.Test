//
//  Album.swift
//  WaldoTest
//
//  Created by Dmytro Baida on 19.02.2021.
//

import Foundation

struct Album: Decodable {
    
    let photos: Photos
    struct Photos: Decodable {
        
        let records: [Record]
        struct Record: Decodable {
            
            let id: String
            let thumbnail_urls: [Thumbnail]
            struct Thumbnail: Decodable {
                
                let size_code: SizeCode
                enum SizeCode: String, Decodable {
                    case small
                    case small1x
                    case small2x
                    case medium
                    case medium1x
                    case medium2x
                    case large
                    case large1x
                    case large2x
                }
                
                let url: String
            }
        }
    }
}
