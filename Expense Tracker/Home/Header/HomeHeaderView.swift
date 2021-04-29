//
//  HomeHeaderView.swift
//  Expense Tracker
//
//  Created by Felix Liman on 29/04/21.
//

import SwiftUI

struct HomeHeaderView: View {
    
    var expense: Int
    var income: Int
    var width: CGFloat
    
    private let dateFormatter: DateFormatter = { () -> DateFormatter in
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM YYYY"
        return formatter
    }()
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(LinearGradient(gradient: Gradient(colors: [.darkPurple, .lightPurple]), startPoint: .top, endPoint: .bottom))
                .frame(width: width, height: 300)
            VStack(spacing: 8) {
                Text("current balance".uppercased())
                    .bold()
                    .font(.body)
                Text("$\(abs(income - expense))")
                    .font(.largeTitle)
                    .bold()
                Text(dateFormatter.string(from: Date()))
                    .bold()
                    .font(.body)
                HStack {
                    CashFlowView(type: .income, value: income)
                    Spacer()
                    CashFlowView(type: .expense, value: abs(expense))
                }
                .padding(.top, 24)
            }
            .foregroundColor(.white)
            .padding(.horizontal, 24)
        }
        .edgesIgnoringSafeArea(.top)
    }
}

