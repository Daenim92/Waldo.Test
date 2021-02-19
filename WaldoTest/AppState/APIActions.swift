//
//  AppAction.swift
//  WaldoTest
//
//  Created by Dmytro Baida on 19.02.2021.
//

import Foundation
import ReSwift
import ReSwiftThunk
import Alamofire


enum APIAction {

    static func tryLogin() -> Thunk<AppState> {
        return Thunk<AppState> { dispatch, getState in
            guard let state = getState() else { return }
            
            
            /*
             {
             "query": "mutation { accountLogin(input: { email: \"thanos+ios+engineer@waldophotos.com\", password: \"!!waldo123_\" }) { success auth_token  }}"
             }
             */
            
            let queryStr =
            """
            {
                "query": "mutation { accountLogin(input: { email: \\"\(state.email)\\", password: \\"\(state.password)\\" }) { success auth_token  }}"
            }
            """
            
            AF.request(state.apiURL, method: .post, headers: ["Content-Type" : "application/json"]) {
                $0.httpBody = queryStr.data(using: .utf8)
            }
            .responseDecodable { (response: DataResponse<AuthResponse, AFError>) in
                switch response.result {
                case .failure(let e):
                    print(e)
                    
                case .success(let auth):
                    print(auth)
                    
                    if auth.data.accountLogin.success {
                        dispatch(AppAction.setAuth(auth.data.accountLogin.auth_token))
                    }
                }
            }
        }
    }
    
    static func getMorePhotos() -> Thunk<AppState> {
        return Thunk<AppState> { dispatch, getState in
            guard let state = getState() else { return }
            
            guard let jwtToken = state.jwtToken else { return }
            
            let batchSize = state.batchSize
            let offset = state.imageURLs.count
            let queryStr =
                """
                {
                "query" : "{ album(id: \\"\(state.albumID)\\") { photos(slice: { limit: \(batchSize), offset: \(offset) }, for_web_gallery: true) { records { id thumbnail_urls { size_code url } } } } }"
                }
                """
            
            AF.request(state.apiURL, method: .post, headers: ["Authorization" : jwtToken, "Content-Type" : "application/json"]) {
                $0.httpBody = queryStr.data(using: .utf8)
            }
            .responseDecodable { (response: DataResponse<AlbumResponse, AFError>) in
                switch response.result {
                case .failure(let e):
                    print(e)
                case .success(let album):
                    print(album)
                    dispatch(AppAction.addPhotos(album.data.album, offset: offset, count: batchSize))
                }
            }
        }
    }
}
