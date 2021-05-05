//
//  CategorySectionContent.swift
//  Expense Tracker
//
//  Created by Felix Liman on 29/04/21.
//

import SwiftUI

struct CategorySectionContent: View {
    
    var categoryModel: CategorySectionModel
    var size: CGSize
    
    var body: some View {
        VStack {
            HStack {
                Text(categoryModel.title)
                    .myFont(.title2)
                Spacer()
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 6)
            LazyVStack {
                ForEach(0..<categoryModel.content.count, id: \.self) { index in
                    CategoryRowContent(model: categoryModel.content[index], size: size)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 10)
                }
            }
        }
    }
}
