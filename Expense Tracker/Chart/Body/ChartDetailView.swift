//
//  ChartDetailView.swift
//  Expense Tracker
//
//  Created by Felix Liman on 29/04/21.
//

import SwiftUI

struct ChartDetailView: View {
    
    var pieData: [PieModel]
    var width: CGFloat
    
    var body: some View {
        VStack {
            ForEach(pieData) { pie in
                HStack {
                    Text(pie.name)
                        .myFont(.body)
                    Spacer()
                    Capsule()
                        .fill(pie.color)
                        .frame(width: getWidth(width: width, value: pie.percent), height: 10)
                    Text(String(format: "\(pie.percent)", "%.0f"))
                        .frame(width: 50, alignment: .trailing)
                        .myFont(.body)
                }
            }
        }.padding()
    }
    
    func getWidth(width: CGFloat, value: CGFloat) -> CGFloat {
        let tmp = value / 100
        return tmp * width
    }
}

