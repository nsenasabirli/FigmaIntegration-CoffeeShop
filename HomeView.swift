//
//  HomeView.swift
//  CoffeeShop
//
//  Created by N Sena Sabırlı on 5.10.2025.
//
//
//  HomeView.swift
//  CoffeeShop
//

import SwiftUI

struct HomeView: View {
    @State private var searchText: String = ""
    @State private var selectedCategoryIndex: Int = 0

    private let categories: [String] = ["All Coffee", "Machiato", "Latte", "Americano"]

    var body: some View {
        ZStack(alignment: .bottom) {
            NavigationStack {
                ScrollView {
                    VStack(alignment: .leading, spacing: 24) {
                        // Header
                        headerview
                        
                        // Search
                        searchbar
                        
                        // Promo banner
                        promoBanner
                        
                        // Categories
                        VStack(alignment: .leading, spacing: 24) {
                            // Categories
                            categoryChips
                            
                            // Product grid
                            productGrid
                        }
                        .padding(.horizontal, 30)
                        .padding(.vertical, 24)
                        .background(Color.white, in: RoundedRectangle(cornerRadius: 24))
                        .padding(.horizontal, -30)
                    }
                    .padding(.horizontal, 30)
                    .padding(.top, 48)
                    .padding(.bottom, 120)
                }
                .background(Color(red: 0.13, green: 0.13, blue: 0.13).ignoresSafeArea())
            }
            .navigationDestination(for: Product.self) { product in
                ProductDetailView(product: product)
            }
            
            // Bottom Tab Bar
            VStack {
                Spacer()
                bottomTabBar
            }
            .ignoresSafeArea(edges: .bottom)
        }
    }

    private var headerview: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Location")
                .font(.system(size: 12, weight: .regular))
                .foregroundColor(.white.opacity(0.5))
            
            HStack(spacing: 6) {
                Text("Bilzen, Tanjungbalai")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.white)
                Image(systemName: "chevron.down")
                    .font(.system(size: 12, weight: .bold))
                    .foregroundColor(.white)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    private var searchbar: some View {
        HStack(spacing: 12) {
            HStack(spacing: 12) {
                Image(systemName: "magnifyingglass")
                    .font(.system(size: 18, weight: .medium))
                    .foregroundColor(.white.opacity(0.3))
                
                TextField("", text: $searchText)
                    .font(.system(size: 14, weight: .regular))
                    .foregroundColor(.white)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    .placeholder(when: searchText.isEmpty) {
                        Text("Search coffee")
                            .font(.system(size: 14, weight: .regular))
                            .foregroundColor(.white.opacity(0.3))
                    }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 16)
            .background(Color(red: 0.19, green: 0.19, blue: 0.19), in: RoundedRectangle(cornerRadius: 14))
            .frame(maxWidth: .infinity)
            
            Button(action: {}) {
                Image(systemName: "slider.horizontal.3")
                    .font(.system(size: 18, weight: .medium))
                    .foregroundColor(.white)
            }
            .frame(width: 52, height: 52)
            .background(Color(red: 0.76, green: 0.48, blue: 0.34), in: RoundedRectangle(cornerRadius: 14))
        }
    }

    private var promoBanner: some View {
        ZStack {
            // Background with gradient
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 0.55, green: 0.40, blue: 0.32),
                    Color(red: 0.48, green: 0.35, blue: 0.28)
                ]),
                startPoint: .leading,
                endPoint: .trailing
            )
            .cornerRadius(16)
            
            HStack(spacing: 0) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Promo")
                        .font(.system(size: 14, weight: .bold))
                        .foregroundColor(.white)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 5)
                        .background(Color(red: 0.93, green: 0.26, blue: 0.26), in: RoundedRectangle(cornerRadius: 8))
                    
                    Text("Buy one get\none FREE")
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(.white)
                        .lineSpacing(-4)
                        .lineLimit(2)
                }
                .padding(.leading, 20)
                
                Spacer()
                
                // Coffee image
                Image(systemName: "cup.and.saucer.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .foregroundColor(.white.opacity(0.15))
                    .padding(.trailing, -10)
            }
        }
        .frame(height: 140)
    }

    private var categoryChips: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                ForEach(Array(categories.enumerated()), id: \.offset) { index, title in
                    let isSelected = index == selectedCategoryIndex
                    Button(action: { selectedCategoryIndex = index }) {
                        Text(title)
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(isSelected ? .white : Color(red: 0.6, green: 0.6, blue: 0.6))
                            .padding(.vertical, 10)
                            .padding(.horizontal, 16)
                            .background(
                                isSelected ? Color(red: 0.76, green: 0.48, blue: 0.34) : Color.white,
                                in: RoundedRectangle(cornerRadius: 12)
                            )
                    }
                }
            }
        }
    }

    private var productGrid: some View {
        LazyVGrid(columns: [
            GridItem(.flexible(), spacing: 20),
            GridItem(.flexible(), spacing: 20)
        ], spacing: 24) {
            ForEach(SampleData.products.prefix(4)) { product in
                NavigationLink(value: product) {
                    ProductCardView(product: product)
                }
            }
        }
    }
    
    private var bottomTabBar: some View {
        HStack(spacing: 0) {
            Spacer()
            TabBarItem(icon: "house.fill", isSelected: true)
            Spacer()
            TabBarItem(icon: "heart", isSelected: false)
            Spacer()
            TabBarItem(icon: "bag", isSelected: false)
            Spacer()
            TabBarItem(icon: "bell", isSelected: false)
            Spacer()
        }
        .frame(height: 70)
        .background(Color.white)
        .shadow(color: Color.black.opacity(0.05), radius: 20, x: 0, y: -5)
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
            
            if isSelected {
                Circle()
                    .fill(Color(red: 0.76, green: 0.48, blue: 0.34))
                    .frame(width: 6, height: 6)
            } else {
                Circle()
                    .fill(Color.clear)
                    .frame(width: 6, height: 6)
            }
        }
        .frame(maxWidth: .infinity)
    }
}

struct ProductCardView: View {
    let product: Product
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // Image section
            ZStack(alignment: .topLeading) {
                RoundedRectangle(cornerRadius: 16)
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                Color.white,
                                Color(red: 0.97, green: 0.97, blue: 0.97)
                            ]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(height: 132)
                    .overlay(
                        Image(systemName: "cup.and.saucer.fill")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(Color.black.opacity(0.06))
                            .padding(28)
                    )
                
                // Rating badge
                HStack(spacing: 4) {
                    Image(systemName: "star.fill")
                        .font(.system(size: 10))
                        .foregroundColor(.orange)
                    Text(String(format: "%.1f", product.rating))
                        .font(.system(size: 10, weight: .semibold))
                        .foregroundColor(.black)
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
                .background(Color.black.opacity(0.06), in: RoundedRectangle(cornerRadius: 10))
                .padding(10)
            }
            
            // Product info
            VStack(alignment: .leading, spacing: 6) {
                Text(product.name)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(Color(red: 0.16, green: 0.13, blue: 0.10))
                    .lineLimit(1)
                
                Text(product.subtitle)
                    .font(.system(size: 12, weight: .regular))
                    .foregroundColor(Color(red: 0.48, green: 0.42, blue: 0.38))
                    .lineLimit(1)
                
                // Price and add button
                HStack(alignment: .center) {
                    Text(String(format: "$ %.2f", product.price))
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(Color(red: 0.16, green: 0.13, blue: 0.10))
                    
                    Spacer()
                    
                    Button(action: {}) {
                        Image(systemName: "plus")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(.white)
                    }
                    .frame(width: 32, height: 32)
                    .background(Color(red: 0.76, green: 0.48, blue: 0.34), in: RoundedRectangle(cornerRadius: 10))
                }
                .padding(.top, 2)
            }
            .padding(12)
        }
        .background(Color.white, in: RoundedRectangle(cornerRadius: 16))
    }
}

// Helper extension for placeholder
extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {
        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}

// Custom corner radius
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}

#Preview {
    HomeView()
}
