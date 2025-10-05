//
//  OtherTabs.swift
//  CoffeeShop
//

import SwiftUI

struct FavoritesView: View {
	var body: some View {
		NavigationStack {
			Text("Favorites coming soon")
				.appBody(AppColors.textSecondary)
				.frame(maxWidth: .infinity, maxHeight: .infinity)
				.background(AppColors.background.ignoresSafeArea())
				.navigationTitle("Favorites")
		}
	}
}

struct CartView: View {
	var body: some View {
		NavigationStack {
			Text("Cart coming soon")
				.appBody(AppColors.textSecondary)
				.frame(maxWidth: .infinity, maxHeight: .infinity)
				.background(AppColors.background.ignoresSafeArea())
				.navigationTitle("Cart")
		}
	}
}

struct ProfileView: View {
	var body: some View {
		NavigationStack {
			Text("Profile coming soon")
				.appBody(AppColors.textSecondary)
				.frame(maxWidth: .infinity, maxHeight: .infinity)
				.background(AppColors.background.ignoresSafeArea())
				.navigationTitle("Profile")
		}
	}
}


