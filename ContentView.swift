//
//  ContentView.swift
//  CoffeeShop
//
//  Created by N Sena Sabırlı on 5.10.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var goToApp: Bool = false
    private let onboardingImageURL: String = "content.png"
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.ignoresSafeArea()
                
                VStack(spacing: 0) {
                    ZStack(alignment: .bottom) {
                        onboardingImage
                            .frame(height: 620)
                            .clipped()
                        LinearGradient(
                            gradient: Gradient(colors: [
                                Color.clear,
                                Color.clear,
                            ]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                        .allowsHitTesting(false)
                        .frame(height: 620)
                    }
                    .ignoresSafeArea(edges: .top)
                    
                    Spacer()
                }
                
                VStack(spacing: 0) {
                    Spacer()
                    
                    VStack(alignment: .center, spacing: 16) {
                        Text("Fall in Love with\nCoffee in Blissful\nDelight!")
                            .font(.system(size: 32, weight: .semibold))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .lineSpacing(6)
                        
                        Text("Welcome to our cozy coffee corner, where\nevery cup is a delightful for you.")
                            .font(.system(size: 14, weight: .regular))
                            .foregroundColor(.white.opacity(0.7))
                            .multilineTextAlignment(.center)
                            .lineSpacing(2)
                    }
                    .padding(.horizontal, 32)
                    .padding(.bottom, 40)
                    
                    Button(action: { goToApp = true }) {
                        Text("Get Started")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 56)
                            .background(
                                Color(red: 0.76, green: 0.48, blue: 0.34)
                            )
                            .cornerRadius(16)
                    }
                    .padding(.horizontal, 32)
                    .padding(.bottom, 50)
                }
            }
            .navigationDestination(isPresented: $goToApp) {
                RootTabView()
            }
        }
    }
}

private extension ContentView {
    var onboardingImage: some View {
        if let url = URL(string: onboardingImageURL), url.scheme == "http" || url.scheme == "https" {
            return AnyView(
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .empty:
                        ZStack { Color.black.opacity(0.2) }
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFill()
                            .clipped()
                    case .failure:
                        ZStack { Color.black.opacity(0.2) }
                    @unknown default:
                        ZStack { Color.black.opacity(0.2) }
                    }
                }
                .frame(maxWidth: .infinity)
                .clipped()
            )
        } else {
            let assetName = onboardingImageURL
                .replacingOccurrences(of: ".png", with: "")
                .replacingOccurrences(of: ".jpg", with: "")
                .replacingOccurrences(of: ".jpeg", with: "")
            return AnyView(
                Image(assetName)
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity)
                    .clipped()
            )
        }
    }
}

#Preview {
    ContentView()
}
