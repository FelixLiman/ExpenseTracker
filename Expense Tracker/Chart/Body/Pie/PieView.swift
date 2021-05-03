//
//  PieView.swift
//  Expense Tracker
//
//  Created by Felix Liman on 30/04/21.
//

import SwiftUI

struct PieView: View {
    
    var pieData: [PieModel]
    var size: CGSize
    
    var body: some View {
        ZStack {
            let center = CGPoint(x: size.width / 2, y: size.width / 2)
            var percent: CGFloat = 0.0
            ForEach(pieData) { pie -> PieChart in
                let start = percent
                let end = start + pie.percent
                percent = end
                return PieChart(center: center, radius: center.x - 32, start: start, end: end, color: pie.color)
            }
            Circle()
                .fill(Color.white)
                .frame(width: 200, height: 200, alignment: .center)
        }
        .frame(height: size.width)
    }
}
