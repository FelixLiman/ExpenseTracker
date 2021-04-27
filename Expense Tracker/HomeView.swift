//
//  HomeView.swift
//  Expense Tracker
//
//  Created by Felix Liman on 27/04/21.
//

import SwiftUI

struct HomeView: View {
    
    @State var transactionData = [
        TransactionModel(title: "Fly to Paris", date: "May 12 at 9.30PM", cost: -532, icon: .airplane),
        TransactionModel(title: "Groceries", date: "May 19 at 9.30PM", cost: -179, icon: .groceries),
        TransactionModel(title: "Salary+Bonus", date: "May 07 at 9.30PM", cost: 1265, icon: .salary),
        TransactionModel(title: "Clothes", date: "May 21 at 9.30PM", cost: -523, icon: .clothes),
        TransactionModel(title: "Home Rent", date: "May 26 at 9.30PM", cost: 840, icon: .home),
        TransactionModel(title: "Fly to Paris", date: "May 12 at 9.30PM", cost: -532, icon: .airplane),
        TransactionModel(title: "Groceries", date: "May 19 at 9.30PM", cost: -179, icon: .groceries),
        TransactionModel(title: "Salary+Bonus", date: "May 07 at 9.30PM", cost: 1265, icon: .salary),
        TransactionModel(title: "Clothes", date: "May 21 at 9.30PM", cost: -523, icon: .clothes),
        TransactionModel(title: "Home Rent", date: "May 26 at 9.30PM", cost: 840, icon: .home)
    ]
    
    init() {
        UIScrollView.appearance().bounces = false
    }
    
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
                            Text("$\(32465)")
                                .bold()
                                .font(.largeTitle)
                            Text("September 2018")
                                .bold()
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
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

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
            VStack(alignment: .leading, spacing: 8) {
                Text(title.uppercased())
                Text("$\(value)")
                    .bold()
            }
        }
        .foregroundColor(.white)
        .padding(.horizontal, 8)
    }
}

enum CashFlowType {
    case income
    case expense
}
