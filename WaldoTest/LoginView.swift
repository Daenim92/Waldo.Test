//
//  LoginView.swift
//  WaldoTest
//
//  Created by Dmytro Baida on 18.02.2021.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var state: AppState
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack(alignment: .leading) {
                Text("Email")
                
                TextField("Email", text: $state.email)
                
                Text("Password")
                
                TextField("Password", text: $state.password)
                
            }
            
            Spacer()
            
            Button("Login") {
                state.tryLogin()
            }
            
            Spacer()
        }
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .padding(.all)
        

    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(AppState())
    }
}
