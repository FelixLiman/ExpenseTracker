//
//  HomeView.swift
//  Expense Tracker
//
//  Created by Felix Liman on 27/04/21.
//

import SwiftUI

struct HomeView: View {
    
    @State var transactionData = [
        TransactionModel(title: "Fly to Paris", date: "May \(Int.random(in: 1...30)) at \(Int.random(in: 0...12)).\(Int.random(in:0...59))PM", cost: Int.random(in: 0...5000) - 2500, icon: .airplane),
        TransactionModel(title: "Groceries", date: "May \(Int.random(in: 1...30)) at \(Int.random(in: 0...12)).\(Int.random(in:0...59))PM", cost: Int.random(in: 0...5000) - 2500, icon: .groceries),
        TransactionModel(title: "Salary+Bonus", date: "May \(Int.random(in: 1...30)) at \(Int.random(in: 0...12)).\(Int.random(in:0...59))PM", cost: Int.random(in: 0...5000) - 2500, icon: .salary),
        TransactionModel(title: "Clothes", date: "May \(Int.random(in: 1...30)) at \(Int.random(in: 0...12)).\(Int.random(in:0...59))PM", cost: Int.random(in: 0...5000) - 2500, icon: .clothes),
        TransactionModel(title: "Home Rent", date: "May \(Int.random(in: 1...30)) at \(Int.random(in: 0...12)).\(Int.random(in:0...59))PM", cost: Int.random(in: 0...5000) - 2500, icon: .home),
        TransactionModel(title: "Fly to Paris", date: "May \(Int.random(in: 1...30)) at \(Int.random(in: 0...12)).\(Int.random(in:0...59))PM", cost: Int.random(in: 0...5000) - 2500, icon: .airplane),
        TransactionModel(title: "Groceries", date: "May \(Int.random(in: 1...30)) at \(Int.random(in: 0...12)).\(Int.random(in:0...59))PM", cost: Int.random(in: 0...5000) - 2500, icon: .groceries),
        TransactionModel(title: "Salary+Bonus", date: "May \(Int.random(in: 1...30)) at \(Int.random(in: 0...12)).\(Int.random(in:0...59))PM", cost: Int.random(in: 0...5000) - 2500, icon: .salary),
        TransactionModel(title: "Clothes", date: "May \(Int.random(in: 1...30)) at \(Int.random(in: 0...12)).\(Int.random(in:0...59))PM", cost: Int.random(in: 0...5000) - 2500, icon: .clothes),
        TransactionModel(title: "Home Rent", date: "May \(Int.random(in: 1...30)) at \(Int.random(in: 0...12)).\(Int.random(in:0...59))PM", cost: Int.random(in: 0...5000) - 2500, icon: .home)
    ]
    
    init() {
        UIScrollView.appearance().bounces = false
    }
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    let expense = transactionData.filter({ $0.cost < 0 }).map({ $0.cost }).reduce(0, +)
                    let income = transactionData.filter({ $0.cost > 0 }).map({ $0.cost }).reduce(0, +)
                    HomeHeaderView(expense: expense, income: income, width: geometry.size.width)
                    LazyVStack {
                        ForEach(0..<transactionData.count, id: \.self) { index in
                            TransactionRowContent(model: transactionData[index], size: geometry.size)
                                .padding(.horizontal, 16)
                                .padding(.vertical, 6)
                        }
                    }
                    .offset(y: -50)
                    .padding(.bottom, -50)
                }
            }
            .edgesIgnoringSafeArea(.all)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
