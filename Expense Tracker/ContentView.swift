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

struct TabBarIcon: View {
    
    @StateObject var viewRouter: ViewRouter
    let assignedPage: Page
    let width, height: CGFloat
    let systemIconName, tabName: String
    
    var body: some View {
        VStack {
            Image(systemName: systemIconName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width, height: height)
                .padding(.top, 10)
            Text(tabName)
                .font(.footnote)
            Spacer()
        }
        .padding(.horizontal, -4)
        .foregroundColor(viewRouter.currentPage == assignedPage ? Color.darkPurple : Color.lightPurple.opacity(0.6))
        .onTapGesture {
            viewRouter.currentPage = assignedPage
        }
    }
}

struct PlusMenu: View {
    let widthAndHeight: CGFloat
    
    var body: some View {
        HStack(spacing: 50) {
            ZStack {
                Circle()
                    .foregroundColor(.lightPurple)
                    .frame(width: widthAndHeight, height: widthAndHeight)
                Image(systemName: "record.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(15)
                    .frame(width: widthAndHeight, height: widthAndHeight)
                    .foregroundColor(.white)
            }
            ZStack {
                Circle()
                    .foregroundColor(.lightPurple)
                    .frame(width: widthAndHeight, height: widthAndHeight)
                Image(systemName: "folder")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(15)
                    .frame(width: widthAndHeight, height: widthAndHeight)
                    .foregroundColor(.white)
            }
        }
        .transition(.scale)
    }
}
