//
//  PieChart.swift
//  Expense Tracker
//
//  Created by Felix Liman on 29/04/21.
//

import SwiftUI

struct PieChart: View {
    var center: CGPoint
    var radius: CGFloat
    var start: CGFloat
    var end: CGFloat
    var color: Color
    
    var body: some View {
        Path { path in
            path.move(to: center)
            path.addArc(center: center, radius: radius, startAngle: Angle(degrees: from()), endAngle: Angle(degrees: to()), clockwise: false)
        }
        .fill(color)
    }
    
    private func from() -> Double {
        let tmp: Double = Double(start / 100) * 360
        return tmp - 90
    }
    
    private func to() -> Double {
        let tmp: Double = Double(end / 100) * 360
        return tmp - 90
    }
}
