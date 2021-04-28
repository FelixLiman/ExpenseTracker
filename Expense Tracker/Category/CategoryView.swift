//
//  CategoryView.swift
//  Expense Tracker
//
//  Created by Felix Liman on 27/04/21.
//

import SwiftUI

struct CategoryView: View {
    @State var text = ""
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    ZStack {
                        Rectangle()
                            .fill(LinearGradient(gradient: Gradient(colors: [.lightPurple, .darkPurple]), startPoint: .leading, endPoint: .trailing))
                            .frame(width: geometry.size.width, height: 200)
                        VStack {
                            HStack {
                                Text("Categories")
                                    .bold()
                                    .font(.largeTitle)
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
                                    .textFieldStyle(OvalTextFieldStyle())
                                    .font(.body)
                                    .foregroundColor(.black)
                            }
                            .padding(.all, 16)
//                            ZStack {
//                                Capsule()
//                                    .frame(width: geometry.size.width - 32, height: 48, alignment: .center)
//                                HStack {
//                                    Image(systemName: "search")
//                                }
//                            }
                        }
                        .offset(y: 20)
                    }
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView()
    }
}

struct CategoryHeaderView: View {
    
    var title: String
    
    var body: some View {
        HStack {
            Text(title)
            Spacer()
        }
    }
}

struct OvalTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background(Color.white)
            .cornerRadius(20)
    }
}
