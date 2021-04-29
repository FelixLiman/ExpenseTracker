//
//  TransactionRowContent.swift
//  Expense Tracker
//
//  Created by Felix Liman on 27/04/21.
//

import SwiftUI

struct TransactionRowContent: View {
    
    var model: TransactionModel
    var size: CGSize
    
    private var foregroundColor: Color {
        switch model.icon {
        case .airplane:
            return Color.darkOrange
        case .groceries:
            return Color.darkPurple
        case .salary:
            return Color.darkGreen
        case .clothes:
            return Color.darkBlue
        case .home:
            return Color.darkPink
        }
    }
    private var backgroundColor: Color {
        switch model.icon {
        case .airplane:
            return Color.paleOrange
        case .groceries:
            return Color.palePurple
        case .salary:
            return Color.paleGreen
        case .clothes:
            return Color.paleBlue
        case .home:
            return Color.palePink
        }
    }
    
    
    var body: some View {
        HStack(spacing: 16) {
            ZStack {
                Circle()
                    .fill(backgroundColor)
                    .frame(width: size.width / 8, height: size.width / 8)
                Image(systemName: "airplane")
                    .resizable()
                    .foregroundColor(foregroundColor)
                    .offset(x: 1)
                    .rotationEffect(Angle(degrees: -45))
                    .frame(width: size.width / 15, height: size.width / 15)
            }
            VStack(alignment: .leading) {
                Text(model.title)
                    .font(.title3)
                Text(model.date)
                    .font(.subheadline)
            }
            Spacer()
            Text(model.cost < 0 ? "- $\(abs(model.cost))" : "+ $\(model.cost)")
                .font(.title3)
                .foregroundColor(model.cost < 0 ? .flatRed : .flatGreen)
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.white)
                .shadow(color: Color.black.opacity(0.15), radius: 6)
        )
    }
}
