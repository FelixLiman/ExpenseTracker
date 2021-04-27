//
//  TransactionModel.swift
//  Expense Tracker
//
//  Created by Felix Liman on 27/04/21.
//

import SwiftUI

struct TransactionModel {
    var title: String
    var date: String
    var cost: Int
    var icon: TransactionIcon
}

enum TransactionIcon {
    case airplane
    case groceries
    case salary
    case clothes
    case home
}
