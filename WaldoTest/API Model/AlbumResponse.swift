//
//  AlbumResponse.swift
//  WaldoTest
//
//  Created by Dmytro Baida on 18.02.2021.
//

import Foundation

/*
 {
     "data": {
         "album": {
             "photos": {
                 "records": [
                     {
                         "id": "4tcJ6CnRaYcF8XgML36YMi1",
                         "thumbnail_urls": [
                             {
                                 "size_code": "small",
                                 "url": "https://s3.amazonaws.com/waldo-thumbs-dev/small/e5d8c8d4-c1b4-5a26-89d6-6b117f6b1f7d.jpg"
                             },
                             {
                                 "size_code": "small2x",
                                 "url": "https://s3.amazonaws.com/waldo-thumbs-dev/small2x/e5d8c8d4-c1b4-5a26-89d6-6b117f6b1f7d.jpg"
                             },
                             {
                                 "size_code": "medium",
                                 "url": "https://s3.amazonaws.com/waldo-thumbs-dev/medium/e5d8c8d4-c1b4-5a26-89d6-6b117f6b1f7d.jpg"
                             },
                             {
                                 "size_code": "medium2x",
                                 "url": "https://s3.amazonaws.com/waldo-thumbs-dev/medium2x/e5d8c8d4-c1b4-5a26-89d6-6b117f6b1f7d.jpg"
                             },
                             {
                                 "size_code": "large",
                                 "url": "https://s3.amazonaws.com/waldo-thumbs-dev/large/e5d8c8d4-c1b4-5a26-89d6-6b117f6b1f7d.jpg"
                             },
                             {
                                 "size_code": "large1x",
                                 "url": "https://s3.amazonaws.com/waldo-thumbs-dev/large1x/e5d8c8d4-c1b4-5a26-89d6-6b117f6b1f7d.jpg"
                             },
                             {
                                 "size_code": "large2x",
                                 "url": "https://s3.amazonaws.com/waldo-thumbs-dev/large2x/e5d8c8d4-c1b4-5a26-89d6-6b117f6b1f7d.jpg"
                             }
                         ]
                     }
                 ]
             }
         }
     },
     "extensions": {
         "completedMs": 7
     }
 }
 */

struct AlbumResponse: Decodable {
    
    let data: Data
    struct Data: Decodable {
        
        let album: Album
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
    }
}
