//
//  CashFlowView.swift
//  Expense Tracker
//
//  Created by Felix Liman on 28/04/21.
//

import SwiftUI

struct CashFlowView: View {
    
    var type: CashFlowType
    var value: Int
    private var imageName: String {
        switch type {
        case .income:
            return "arrow.down.left.circle.fill"
        case .expense:
            return "arrow.up.right.circle.fill"
        }
    }
    private var title: String {
        switch type {
        case .income:
            return "income"
        case .expense:
            return "expense"
        }
    }
    
    var body: some View {
        HStack(alignment: .top) {
            Image(systemName: imageName)
                .aspectRatio(contentMode: .fit)
                .offset(y: 2)
            VStack(alignment: .leading, spacing: 0) {
                Text(title.uppercased())
                Text("$\(value)")
                    .bold()
            }
            .font(.body)
        }
        .foregroundColor(.white)
        .padding(.horizontal, 8)
    }
}

enum CashFlowType {
    case income
    case expense
}
