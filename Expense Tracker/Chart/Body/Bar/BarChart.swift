//
//  BarChart.swift
//  Expense Tracker
//
//  Created by Felix Liman on 30/04/21.
//

import SwiftUI

struct BarChart: View {
    var value: CGFloat
    var name: String
    var color: Color

    var body: some View {
        VStack {
            ZStack(alignment: .bottom) {
                Capsule().frame(width: 30, height: value)
                    .foregroundColor(color)
            }
            Text(name)
        }
    }
}
