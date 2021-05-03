//
//  AccountHeaderView.swift
//  Expense Tracker
//
//  Created by Felix Liman on 03/05/21.
//

import SwiftUI

struct AccountHeaderView: View {
    var body: some View {
        HStack {
            Text("Account")
                .bold()
                .font(.largeTitle)
                .foregroundColor(.white)
            Spacer()
            Image("megumi")
                .resizable()
                .clipShape(Circle())
                .frame(width: 72, height: 72, alignment: .center)
        }
        .padding(.horizontal, 16)
        .offset(y: 20)
    }
}

struct AccountHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        AccountHeaderView()
    }
}
