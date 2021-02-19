//
//  File.swift
//  WaldoTest
//
//  Created by Dmytro Baida on 18.02.2021.
//

import Foundation

/*
 {
     "data": {
         "accountLogin": {
             "success": true,
             "auth_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhY2NvdW50X2lkIjoiMmE1NzA0YTctZTY3Yi00ZmQzLTk5YWQtZDE3OTQ0OWI2YjczIiwicm9sZXMiOlsiY29uc3VtZXIiXSwiaXNzIjoid2FsZG86Y29yZSIsImdyYW50cyI6WyJhbGJ1bXM6dmlldzpwdWJsaWMiLCJhbGJ1bXM6ZWRpdDpvd25lZCIsImFsYnVtczpjcmVhdGU6cHJpdmF0ZSIsImFsYnVtczp2aWV3OmpvaW5lZCIsImFsYnVtczpkZWxldGU6b3duZWQiLCJhbGJ1bXM6Y3JlYXRlOnB1YmxpYyIsImFsYnVtczpjcmVhdGU6b3duZWQiLCJhbGJ1bXM6dmlldzpvd25lZCJdLCJleHAiOjE2MTYyNzAxNzMsImlhdCI6MTYxMzY3ODE3M30.XeCeEWF6PymaMgX2fVsoiCJYxLb0frLv3KP_rp1fSlM"
         }
     },
     "extensions": {
         "completedMs": 239
     }
 }
 */

struct AuthResponse: Decodable {
    
    let data: Data
    struct Data: Decodable {
        
        let accountLogin: AccountLogin
        struct AccountLogin: Decodable {
            
            let success: Bool
            let auth_token: String
        }
    }
    
}
