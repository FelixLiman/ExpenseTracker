//
//  ContentView.swift
//  Expense Tracker
//
//  Created by Felix Liman on 23/04/21.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewRouter: ViewRouter
    @State var showPopUp: Bool = false
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                Spacer()
                switch viewRouter.currentPage {
                case .home:
                    HomeView()
                case .category:
                    CategoryView()
                case .chart:
                    ChartView()
                case .user:
                    AccountView()
                }
                ZStack {
                    if showPopUp {
                        PlusMenu(widthAndHeight: geometry.size.width / 7)
                            .offset(y: -geometry.size.height / 6)
                    }
                    HStack {
                        let width = geometry.size.width / 5
                        let height = geometry.size.height / 28
                        TabBarIcon(viewRouter: viewRouter, assignedPage: .home, width: width, height: height, systemIconName: "homekit", tabName: "Home")
                        TabBarIcon(viewRouter: viewRouter, assignedPage: .category, width: width, height: height, systemIconName: "square.grid.2x2", tabName: "Category")
                        ZStack {
                            Circle()
                                .foregroundColor(.white)
                                .frame(width: geometry.size.width / 7, height: geometry.size.width / 7)
                                .shadow(radius: 4)
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: geometry.size.width / 7 - 6, height: geometry.size.width / 7 - 6)
                                .foregroundColor(Color.lightPurple)
                                .rotationEffect(Angle(degrees: showPopUp ? 45 : 0))
                        }
                        .offset(y: -geometry.size.height / 8 / 2)
                        .onTapGesture {
                            withAnimation {
                                showPopUp.toggle()
                            }
                        }
                        TabBarIcon(viewRouter: viewRouter, assignedPage: .chart, width: width, height: height, systemIconName: "chart.pie", tabName: "Chart")
                        TabBarIcon(viewRouter: viewRouter, assignedPage: .user, width: width, height: height, systemIconName: "person.crop.circle", tabName: "Account")
                    }
                        .frame(width: geometry.size.width, height: geometry.size.height / 8)
                    .background(Color.white.shadow(radius: 2))
                }
            }
            .edgesIgnoringSafeArea(.vertical)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewRouter: ViewRouter())
    }
}
