//
//  LineView.swift
//  Expense Tracker
//
//  Created by Felix Liman on 30/04/21.
//

import SwiftUI
import SpriteKit

struct LineView: View {
    
    var pieData: [PieModel]
    var size: CGSize
    
    private var xValues: [CGFloat]
    private var yValues: [CGFloat]
    private var sequence: SKKeyframeSequence
    private var xMin: CGFloat
    private var xMax: CGFloat
    private var splinedValues: [(CGFloat, CGFloat)]
    
    init(pieData: [PieModel], size: CGSize) {
        self.pieData = pieData
        self.size = size
        
        xValues = Array(0...(pieData.count - 1)).map({ CGFloat(CGFloat($0) * (size.width - 32) / CGFloat(pieData.count - 1)) })
        yValues = pieData.map({ $0.percent * -3 })
        sequence = SKKeyframeSequence(keyframeValues: yValues,
                                      times: xValues as [NSNumber])
        sequence.interpolationMode = .spline

        xMin = xValues.min()!
        xMax = xValues.max()!
        splinedValues = [(CGFloat, CGFloat)]()
        stride(from: xMin, to: xMax, by: (xMax - xMin) / 200).forEach {
            splinedValues.append((CGFloat($0),
                                  sequence.sample(atTime: CGFloat($0)) as! CGFloat))
        }
    }
    
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: splinedValues[0].0, y: splinedValues[0].1))

            for splineValue in splinedValues.dropFirst() {
                path.addLine(to: CGPoint(x: splineValue.0, y: splineValue.1))
            }
        }
        .stroke(style: StrokeStyle(lineWidth: 6, lineCap: .round))
        .fill(LinearGradient(gradient: Gradient(colors: pieData.map({ $0.color })), startPoint: .leading, endPoint: .trailing))
        .frame(width: size.width - 32, height: 150)
        .offset(y: 125)
    }
}
