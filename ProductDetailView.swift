//
//  ProductDetailView.swift
//  CoffeeShop
//

import SwiftUI

struct ProductDetailView: View {
	let product: Product
	@State private var quantity: Int = 1

	var body: some View {
		ScrollView {
			VStack(alignment: .leading, spacing: AppSpacing.lg) {
				RoundedRectangle(cornerRadius: 24)
					.fill(AppColors.surface)
					.frame(height: 280)
					.overlay(
						Image(systemName: "cup.and.saucer.fill")
							.resizable()
							.scaledToFit()
							.foregroundColor(AppColors.primary.opacity(0.9))
							.padding(AppSpacing.xl)
					)

				VStack(alignment: .leading, spacing: AppSpacing.sm) {
					Text(product.name).appTitle()
					Text(product.subtitle).appBody(AppColors.textSecondary)
				}

				HStack(spacing: AppSpacing.lg) {
					quantityStepper
					Spacer()
					Text(String(format: "$%.2f", product.price * Double(quantity)))
						.font(.system(size: 24, weight: .bold))
				}

				Button(action: {}) {
					Text("Add to Cart")
						.font(.system(size: 16, weight: .semibold))
						.foregroundColor(.white)
						.frame(maxWidth: .infinity)
						.padding()
						.background(AppColors.primary, in: RoundedRectangle(cornerRadius: 16))
				}
			}
			.padding(AppSpacing.lg)
		}
		.background(AppColors.background.ignoresSafeArea())
	}

	private var quantityStepper: some View {
		HStack(spacing: AppSpacing.md) {
			Button(action: { if quantity > 1 { quantity -= 1 } }) {
				Image(systemName: "minus")
					.font(.system(size: 14, weight: .bold))
					.foregroundColor(AppColors.textPrimary)
			}
			.frame(width: 36, height: 36)
			.background(AppColors.surface, in: RoundedRectangle(cornerRadius: 10))

			Text("\(quantity)")
				.font(.system(size: 16, weight: .semibold))
				.foregroundColor(AppColors.textPrimary)

			Button(action: { quantity += 1 }) {
				Image(systemName: "plus")
					.font(.system(size: 14, weight: .bold))
					.foregroundColor(.white)
			}
			.frame(width: 36, height: 36)
			.background(AppColors.primary, in: RoundedRectangle(cornerRadius: 10))
		}
	}
}

#Preview {
	ProductDetailView(product: SampleData.products.first!)
}


