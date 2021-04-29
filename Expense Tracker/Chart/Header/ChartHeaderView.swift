//
//  ChartHeaderView.swift
//  Expense Tracker
//
//  Created by Felix Liman on 29/04/21.
//

import SwiftUI

struct ChartHeaderView: View {
    var body: some View {
        HStack {
            Text("Charts")
                .bold()
                .font(.largeTitle)
                .foregroundColor(.white)
            Spacer()
        }
        .padding(.horizontal, 16)
        .offset(y: 20)
    }
}

struct ChartHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ChartHeaderView()
    }
}
