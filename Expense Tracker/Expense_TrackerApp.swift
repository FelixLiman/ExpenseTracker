//
//  Expense_TrackerApp.swift
//  Expense Tracker
//
//  Created by Felix Liman on 23/04/21.
//

import SwiftUI

@main
struct Expense_TrackerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewRouter: ViewRouter())
        }
    }
}
