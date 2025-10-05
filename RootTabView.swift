//
//  RootTabView.swift
//  CoffeeShop
//

import SwiftUI

struct RootTabView: View {
    @State private var selectedIndex: Int = 0

    var body: some View {
        TabView(selection: $selectedIndex) {
            HomeView()
                .tabItem {
                    Image(systemName: selectedIndex == 0 ? "house.fill" : "house")
                }
                .tag(0)

            FavoritesView()
                .tabItem {
                    Image(systemName: selectedIndex == 1 ? "heart.fill" : "heart")
                }
                .tag(1)

            CartView()
                .tabItem {
                    Image(systemName: selectedIndex == 2 ? "bag.fill" : "bag")
                }
                .tag(2)

            ProfileView()
                .tabItem {
                    Image(systemName: selectedIndex == 3 ? "bell.fill" : "bell")
                }
                .tag(3)
        }
        .tint(Color(red: 0.76, green: 0.48, blue: 0.34))
    }
}

#Preview {
    RootTabView()
}
