//
//  BackgroundHeader.swift
//  Expense Tracker
//
//  Created by Felix Liman on 29/04/21.
//

import SwiftUI

struct BackgroundHeader: View {
    var width: CGFloat
    
    var body: some View {
        Rectangle()
            .fill(LinearGradient(gradient: Gradient(colors: [.lightPurple, .darkPurple]), startPoint: .leading, endPoint: .trailing))
            .frame(width: width, height: 200)
    }
}
