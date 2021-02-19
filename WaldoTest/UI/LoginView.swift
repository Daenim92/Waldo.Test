//
//  LoginView.swift
//  WaldoTest
//
//  Created by Dmytro Baida on 18.02.2021.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var store: StoreWrapper
    
    @State var email = ""
    @State var password = ""

    var body: some View {
        VStack {
            Spacer()
            
            VStack(alignment: .leading) {
                Text("Email")
                
                TextField("Email", text: Binding<String>(get: {
                    store.state.email
                }, set: {
                    store.dispatch(UserAction.setEmail($0))
                }))
                
                Text("Password")
                
                TextField("Password", text: Binding(get: {
                    store.state.password
                }, set: {
                    store.dispatch(UserAction.setPassword($0))
                }))
                
            }
            
            Spacer()
            
            Button("Login") {
                store.dispatch(APIAction.tryLogin())
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
    }
}
