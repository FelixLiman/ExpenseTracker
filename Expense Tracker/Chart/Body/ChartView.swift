//
//  ChartView.swift
//  Expense Tracker
//
//  Created by Felix Liman on 27/04/21.
//

import SwiftUI

struct ChartView: View {
    
    var pieData = [
        PieModel(id: 1, percent: 17, name: "Burger", color: .lightPink),
        PieModel(id: 2, percent: 8, name: "Noodles", color: .lightRed),
        PieModel(id: 3, percent: 23, name: "Pizza", color: .lightOrange),
        PieModel(id: 4, percent: 5, name: "Drinks", color: .lightGreen),
        PieModel(id: 5, percent: 13, name: "Pet Food", color: .lightSkyBlue),
        PieModel(id: 6, percent: 30, name: "Games", color: .lightBlue),
        PieModel(id: 7, percent: 4, name: "Movies", color: .lightPurple)
    ]
    
    var chartType: [ChartType] = [.pie, .bar, .line]
    
    @State private var preferredType: ChartType = .line
    
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
                Picker(selection: $preferredType, label: /*@START_MENU_TOKEN@*/Text("Picker")/*@END_MENU_TOKEN@*/, content: {
                    ForEach(chartType, id: \.self) { chart in
                        Text("\(chart.rawValue)")
                    }
                })
                .pickerStyle(SegmentedPickerStyle())
                .padding(16)
                .padding(.bottom, -24)
                switch preferredType {
                case .pie:
                    PieView(pieData: pieData, size: geometry.size)
                case .bar:
                    BarView(pieData: pieData, size: geometry.size)
                case .line:
                    LineView(pieData: pieData, size: geometry.size)
                }
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

enum ChartType: String {
    case pie = "Pie"
    case bar = "Bar"
    case line = "Line"
}
