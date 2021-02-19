//
//  AppStateStore.swift
//  WaldoTest
//
//  Created by Dmytro Baida on 19.02.2021.
//

import Foundation
import ReSwift

typealias Reducer = (AppState?, AppAction) -> AppState

class StoreWrapper: ObservableObject, StoreSubscriber {
    
    @Published private(set) var state: AppState
    
    private let store: Store<AppState>
    
    init(_ store: Store<AppState>) {
        self.store = store
        self.state = store.state
        self.store.subscribe(self)
    }
    
    deinit {
        self.store.unsubscribe(self)
    }
    
    func newState(state: AppState) {
        self.state = state
    }
    
    func dispatch(_ action: Action) {
        store.dispatch(action)
    }
}
