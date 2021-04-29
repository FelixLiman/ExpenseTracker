//
//  CategoryRowContent.swift
//  Expense Tracker
//
//  Created by Felix Liman on 29/04/21.
//

import SwiftUI

struct CategoryRowContent: View {
    
    var model: CategoryModel
    var size: CGSize
    
    private var foregroundColor: Color {
        switch model.icon {
        case .burger:
            return Color.darkOrange
        case .noodles:
            return Color.darkGreen
        case .pizza:
            return Color.darkPink
        case .drinks:
            return Color.darkSkyBlue
        case .petFood:
            return Color.darkPurple
        case .games:
            return Color.darkBlue
        case .movies:
            return Color.darkRed
        }
    }
    private var backgroundColor: Color {
        switch model.icon {
        case .burger:
            return Color.paleOrange
        case .noodles:
            return Color.paleGreen
        case .pizza:
            return Color.palePink
        case .drinks:
            return Color.paleSkyBlue
        case .petFood:
            return Color.palePurple
        case .games:
            return Color.paleBlue
        case .movies:
            return Color.paleRed
        }
    }
    
    
    var body: some View {
        HStack(spacing: 16) {
            ZStack {
                Circle()
                    .fill(backgroundColor)
                    .frame(width: size.width / 9, height: size.width / 9)
                Image(systemName: "airplane")
                    .resizable()
                    .foregroundColor(foregroundColor)
                    .offset(x: 1)
                    .rotationEffect(Angle(degrees: -45))
                    .frame(width: size.width / 15, height: size.width / 15)
            }
            Text(model.title)
                .font(.title3)
            Spacer()
            Image(systemName: "chevron.right")
        }
    }
}
