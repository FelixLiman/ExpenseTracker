//
//  ViewRouter.swift
//  Expense Tracker
//
//  Created by Felix Liman on 24/04/21.
//

import SwiftUI

class ViewRouter: ObservableObject {
    @Published var currentPage: Page = .home
}

enum Page {
    case home
    case category
    case chart
    case user
}
