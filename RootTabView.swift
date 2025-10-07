//
//  RootTabView.swift
//  CoffeeShop
//

import SwiftUI

struct RootTabView: View {
    @State private var selectedTab: Int = 0

    var body: some View {
        ZStack(alignment: .bottom) {
            // Main content based on selected tab
            Group {
                switch selectedTab {
                case 0:
                    HomeView()
                case 1:
                    FavoritesView()
                case 2:
                    CartView()
                case 3:
                    ProfileView()
                default:
                    HomeView()
                }
            }
            
            // Custom floating tab bar
            CustomTabBar(selectedTab: $selectedTab)
                .padding(.bottom, 10)
                .padding(.horizontal, 16)
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

struct CustomTabBar: View {
    @Binding var selectedTab: Int
    
    var body: some View {
        HStack(spacing: 0) {
            TabBarItem(icon: "house.fill", isSelected: selectedTab == 0)
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 0.2)) {
                        selectedTab = 0
                    }
                }
            
            TabBarItem(icon: "heart", isSelected: selectedTab == 1)
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 0.2)) {
                        selectedTab = 1
                    }
                }
            
            TabBarItem(icon: "bag", isSelected: selectedTab == 2)
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 0.2)) {
                        selectedTab = 2
                    }
                }
            
            TabBarItem(icon: "bell", isSelected: selectedTab == 3)
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 0.2)) {
                        selectedTab = 3
                    }
                }
        }
        .frame(height: 64)
        .padding(.horizontal, 24)
        .background(
            RoundedRectangle(cornerRadius: 32)
                .fill(Color.white)
                .shadow(color: Color.black.opacity(0.06), radius: 20, x: 0, y: 6)
        )
    }
}

struct TabBarItem: View {
    let icon: String
    let isSelected: Bool
    
    var body: some View {
        VStack(spacing: 6) {
            Image(systemName: icon)
                .font(.system(size: 22, weight: isSelected ? .semibold : .regular))
                .foregroundColor(isSelected ? Color(red: 0.76, green: 0.48, blue: 0.34) : Color(red: 0.7, green: 0.7, blue: 0.7))
            
            Circle()
                .fill(isSelected ? Color(red: 0.76, green: 0.48, blue: 0.34) : Color.clear)
                .frame(width: 6, height: 6)
        }
        .frame(maxWidth: .infinity)
        .contentShape(Rectangle())
    }
}

#Preview {
    RootTabView()
}
