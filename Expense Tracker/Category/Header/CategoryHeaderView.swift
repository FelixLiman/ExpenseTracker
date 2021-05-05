//
//  CategoryHeaderView.swift
//  Expense Tracker
//
//  Created by Felix Liman on 29/04/21.
//

import SwiftUI

struct CategoryHeaderView: View {
    @Binding var text: String
    
    var body: some View {
        VStack {
            HStack {
                Text("Categories")
                    .bold()
                    .myFont(.largeTitle)
                    .foregroundColor(.white)
                Spacer()
                Image(systemName: "plus")
                    .foregroundColor(.white)
                    .onTapGesture {
                        print("Add")
                    }
            }
            .padding(.horizontal, 16)
            HStack {
                TextField("Search...", text: $text)
                    .myFont(.body)
                    .foregroundColor(.black)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 10)
            }
            .background(
                Rectangle()
                    .fill(Color.white)
                    .cornerRadius(20)
            )
            .padding(.all, 16)
        }
        .offset(y: 20)
    }
}
