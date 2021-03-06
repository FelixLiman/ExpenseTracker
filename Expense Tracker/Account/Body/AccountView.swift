//
//  AccountView.swift
//  Expense Tracker
//
//  Created by Felix Liman on 27/04/21.
//

import SwiftUI

struct AccountView: View {
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical, showsIndicators: false) {
                ZStack {
                    BackgroundHeader(width: geometry.size.width)
                    AccountHeaderView()
                }
                HStack {
                    Text("I")
                }
            }
        }.edgesIgnoringSafeArea(.top)
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
