//
//  FeaturedCard.swift
//  CoffeeShop
//

import SwiftUI

struct FeaturedCard: View {
	let product: Product

	var body: some View {
		VStack(alignment: .leading, spacing: AppSpacing.sm) {
			RoundedRectangle(cornerRadius: 16)
				.fill(AppColors.surface)
				.frame(width: 180, height: 140)
				.overlay(
					Image(systemName: "cup.and.saucer.fill")
						.resizable()
						.scaledToFit()
						.foregroundColor(AppColors.primary.opacity(0.9))
						.padding(AppSpacing.lg)
				)

			Text(product.name)
				.appHeadline()
				.lineLimit(1)
			Text(product.subtitle)
				.appCaption(AppColors.textSecondary)
				.lineLimit(1)

			HStack {
				Text(String(format: "$%.2f", product.price))
					.font(.system(size: 14, weight: .semibold))
					.foregroundColor(AppColors.textPrimary)
				Spacer()
				HStack(spacing: 2) {
					Image(systemName: "star.fill").foregroundColor(.yellow)
					Text(String(format: "%.1f", product.rating))
						.font(.system(size: 12, weight: .semibold))
						.foregroundColor(AppColors.textPrimary)
				}
			}
		}
		.frame(width: 180)
	}
}

#Preview {
	FeaturedCard(product: SampleData.products.first!)
}


