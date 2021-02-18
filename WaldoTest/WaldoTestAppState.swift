//
//  WaldoTestModel.swift
//  WaldoTest
//
//  Created by Dmytro Baida on 18.02.2021.
//

import Foundation
import Alamofire


class AppState: ObservableObject {
    
    @Published var imageURLs = [String]()

    //
        
    @Published var jwtToken: String?
    
    var email: String = "thanos+ios+engineer@waldophotos.com"
    var password: String = "!!waldo123_"
    
    var albumID: String? = "exHbvthJfbuFwiusSJuVAm"
    
    //
    
    let apiURL = URL(string: "https://core-graphql.dev.waldo.photos/gql")!

    let batchSize = 20
    
}

var session: Session = {
    let config = URLSessionConfiguration.af.default
    var headers = HTTPHeaders.default
    headers["Content-Type"] = "application/json"
    config.headers = headers
    let s = Session(configuration: config)
    return s
}()

extension AppState { //actions
    

    
    //
    //TODO: find a proper solution to build queries
    
    func tryLogin() {
        
/*
{
    "query": "mutation { accountLogin(input: { email: \"thanos+ios+engineer@waldophotos.com\", password: \"!!waldo123_\" }) { success auth_token  }}"
}
*/
        
        let queryStr =
"""
{
    "query": "mutation { accountLogin(input: { email: \\"\(email)\\", password: \\"\(password)\\" }) { success auth_token  }}"
}
"""

        session.request(apiURL, method: .post) {
            $0.httpBody = queryStr.data(using: .utf8)
        }
        .responseString(completionHandler: {
            print($0)
        })
        .responseDecodable { (response: DataResponse<AuthResponse, AFError>) in
            switch response.result {
            case .failure(let e):
                print(e)
                
            case .success(let auth):
                print(auth)
                
                if auth.data.accountLogin.success {
                    self.jwtToken = auth.data.accountLogin.auth_token
                }
            }
        }
    }
    
    func didScrollToEnd() {
        
        guard let jwtToken = jwtToken else { return }
        guard let albumID = albumID else { return }
        
        let batchSize = self.batchSize
        let offset = imageURLs.count
        let queryStr =
"""
{
    "query" : "{ album(id: \\"\(albumID)\\") { photos(slice: { limit: \(batchSize), offset: \(offset) }, for_web_gallery: true) { records { id thumbnail_urls { size_code url } } } } }"
}
"""
        
        session.request(apiURL, method: .post, headers: ["Authorization" : jwtToken]) {
            $0.httpBody = queryStr.data(using: .utf8)
        }
        .responseString(completionHandler: {
            print($0)
        })
        .responseDecodable { (response: DataResponse<AlbumResponse, AFError>) in
            switch response.result {
            case .failure(let e):
                print(e)
            case .success(let album):
                print(album)
                self.processAlbumResponse(album.data.album, offset: offset, batchSize: batchSize)
            }
        }
    }
    
    func processAlbumResponse(_ album: AlbumResponse.Data.Album, offset: Int, batchSize: Int) {
        
        let bestSizedThumbnails = album.photos.records.compactMap {
            $0.thumbnail_urls.sorted { $0.size_code.rawValue < $1.size_code.rawValue } .first?.url
        }
        
        imageURLs.insert(contentsOf: bestSizedThumbnails, at: offset)
    }
}
