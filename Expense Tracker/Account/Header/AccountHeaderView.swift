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
            VStack(alignment: .leading, spacing: 4) {
                Text("Felix Liman")
                    .bold()
                    .myFont(.largeTitle)
                    .foregroundColor(.white)
                    .lineLimit(2)
                Text("iOS Developer")
                    .bold()
                    .myFont(.title3)
                    .foregroundColor(.white)
            }
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
