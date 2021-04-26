//
//  NavigationItem.swift
//  Expense Tracker
//
//  Created by Felix Liman on 26/04/21.
//

import SwiftUI

struct NavigationItem {
    var view: AnyView
}

final class NavigationStack: ObservableObject {
    @Published var viewStack: [NavigationItem] = []
    @Published var currentView: NavigationItem
    
    init(_ currentView: NavigationItem) {
        self.currentView = currentView
    }

    func unwind() {
        if viewStack.count == 0 {
            return
        }
        let last = viewStack.count - 1
        currentView = viewStack[last]
        viewStack.remove(at: last)
    }
    
    func advance(_ view: NavigationItem) {
        viewStack.append(currentView)
        currentView = view
    }
    
    func home() {
        currentView = NavigationItem(view: AnyView(ContentView(viewRouter: ViewRouter())))
        viewStack.removeAll()
    }
}
