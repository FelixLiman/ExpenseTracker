//
//  CategoryView.swift
//  Expense Tracker
//
//  Created by Felix Liman on 27/04/21.
//

import SwiftUI

struct CategoryView: View {
    @State var categoryData = [
        CategorySectionModel(title: "Food", content: [
            CategoryModel(title: "Burger", icon: .burger),
            CategoryModel(title: "Noodles", icon: .noodles),
            CategoryModel(title: "Pizza", icon: .pizza),
            CategoryModel(title: "Drinks", icon: .drinks),
            CategoryModel(title: "Pet Food", icon: .petFood)
        ]),
        CategorySectionModel(title: "Entertainment", content: [
            CategoryModel(title: "Games", icon: .games),
            CategoryModel(title: "Movies", icon: .movies)
        ]),
        CategorySectionModel(title: "Food", content: [
            CategoryModel(title: "Burger", icon: .burger),
            CategoryModel(title: "Noodles", icon: .noodles),
            CategoryModel(title: "Pizza", icon: .pizza),
            CategoryModel(title: "Drinks", icon: .drinks),
            CategoryModel(title: "Pet Food", icon: .petFood)
        ]),
        CategorySectionModel(title: "Entertainment", content: [
            CategoryModel(title: "Games", icon: .games),
            CategoryModel(title: "Movies", icon: .movies)
        ])
    ]
    
    @State var text = ""
    
    init() {
        UIScrollView.appearance().bounces = false
    }
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical, showsIndicators: false) {
                ZStack {
                    BackgroundHeader(width: geometry.size.width)
                    CategoryHeaderView(text: $text)
                }
                LazyVStack {
                    ForEach(0..<categoryData.count, id: \.self) { index in
                        CategorySectionContent(categoryModel: categoryData[index], size: geometry.size)
                    }
                }
            }
            .edgesIgnoringSafeArea(.top)
        }
    }
}
    
struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView()
    }
}
