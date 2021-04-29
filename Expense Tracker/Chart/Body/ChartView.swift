//
//  ChartView.swift
//  Expense Tracker
//
//  Created by Felix Liman on 27/04/21.
//

import SwiftUI

struct ChartView: View {
    
    var pieData = [
        PieModel(id: 1, percent: 8, name: "Burger", color: .lightGreen),
        PieModel(id: 2, percent: 17, name: "Noodles", color: .lightRed),
        PieModel(id: 3, percent: 23, name: "Pizza", color: .lightPink),
        PieModel(id: 4, percent: 13, name: "Drinks", color: .lightOrange),
        PieModel(id: 5, percent: 5, name: "Pet Food", color: .lightSkyBlue),
        PieModel(id: 6, percent: 30, name: "Games", color: .lightPurple),
        PieModel(id: 7, percent: 4, name: "Movies", color: .lightBlue)
    ]
    
    init() {
        UIScrollView.appearance().bounces = false
    }
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical, showsIndicators: false) {
                ZStack {
                    BackgroundHeader(width: geometry.size.width)
                    ChartHeaderView()
                }
                ZStack {
                    let center = CGPoint(x: geometry.size.width / 2, y: geometry.size.width / 2)
                    var percent: CGFloat = 0.0
                    ForEach(pieData) { pie -> PieChart in
                        let start = percent
                        let end = start + pie.percent
                        percent = end
                        return PieChart(center: center, radius: center.x - 32, start: start, end: end, color: pie.color)
                    }
                }
                .frame(height: geometry.size.width)
                ChartDetailView(pieData: pieData, width: geometry.size.width)
            }
        }.edgesIgnoringSafeArea(.top)
    }
}
        
struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView()
    }
}
