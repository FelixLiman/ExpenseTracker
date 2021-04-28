//
//  TabBarIcon.swift
//  Expense Tracker
//
//  Created by Felix Liman on 28/04/21.
//

import SwiftUI

struct TabBarIcon: View {
    
    @StateObject var viewRouter: ViewRouter
    let assignedPage: Page
    let width, height: CGFloat
    let systemIconName, tabName: String
    
    var body: some View {
        VStack {
            Image(systemName: systemIconName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width, height: height)
                .padding(.top, 10)
            Text(tabName)
                .font(.footnote)
            Spacer()
        }
        .padding(.horizontal, -4)
        .foregroundColor(viewRouter.currentPage == assignedPage ? Color.lightPurple : Color.lightPurple.opacity(0.5))
        .onTapGesture {
            viewRouter.currentPage = assignedPage
        }
    }
}

