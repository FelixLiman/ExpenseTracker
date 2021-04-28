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
    
    private let dateFormatter: DateFormatter = { () -> DateFormatter in
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM YYYY"
        return formatter
    }()
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    ZStack {
                        Rectangle()
                            .fill(LinearGradient(gradient: Gradient(colors: [.darkPurple, .lightPurple]), startPoint: .top, endPoint: .bottom))
                            .frame(width: geometry.size.width, height: 300)
                        VStack(spacing: 8) {
                            Text("current balance".uppercased())
                                .bold()
                                .font(.body)
                            Text("$\(32465)")
                                .font(.largeTitle)
                                .bold()
                            Text(dateFormatter.string(from: Date()))
                                .bold()
                                .font(.body)
                            HStack {
                                CashFlowView(type: .income, value: 42500)
                                Spacer()
                                CashFlowView(type: .expense, value: 12421)
                            }
                            .padding(.top, 24)
                        }
                        .foregroundColor(.white)
                        .padding(.horizontal, 24)
                    }
                    .edgesIgnoringSafeArea(.top)
                    LazyVStack {
                        ForEach(0..<transactionData.count, id: \.self) { index in
                            TransactionRowContent(model: transactionData[index])
                                .frame(width: geometry.size.width - 24, height: 90)
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
