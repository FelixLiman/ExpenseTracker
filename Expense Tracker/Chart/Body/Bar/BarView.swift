//
//  BarView.swift
//  Expense Tracker
//
//  Created by Felix Liman on 30/04/21.
//

import SwiftUI

struct BarView: View {
    var pieData: [PieModel]
    var size: CGSize
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 8) {
            ForEach(pieData) { pie in
                BarChart(value: pie.percent * 8, name: pie.name.first?.uppercased() ?? "", color: pie.color)
            }
        }.padding()
    }
}
    
