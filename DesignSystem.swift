//
//  DesignSystem.swift
//  CoffeeShop
//
//  Defines app-wide colors, typography, and spacing to match Figma.
//

import SwiftUI

extension Color {
	init(hex: String, alpha: Double = 1.0) {
		let hexString = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
		var int: UInt64 = 0
		Scanner(string: hexString).scanHexInt64(&int)
		let r, g, b: UInt64
		if hexString.count == 6 {
			r = (int >> 16) & 0xFF
			g = (int >> 8) & 0xFF
			b = int & 0xFF
		} else if hexString.count == 8 { // AARRGGBB
			r = (int >> 16) & 0xFF
			g = (int >> 8) & 0xFF
			b = int & 0xFF
		} else {
			r = 0; g = 0; b = 0
		}
		self = Color(red: Double(r) / 255.0, green: Double(g) / 255.0, blue: Double(b) / 255.0).opacity(alpha)
	}
}

enum AppColors {
	// These can be adjusted to match Figma precisely
	static let primary = Color(hex: "6C3A20")
	static let background = Color(hex: "F6F2EC")
	static let surface = Color(hex: "FFFFFF")
	static let textPrimary = Color(hex: "2A1F1A")
	static let textSecondary = Color(hex: "7A6A61")
	static let accent = Color(hex: "D57A3D")
}

enum AppSpacing {
	static let xs: CGFloat = 4
	static let sm: CGFloat = 8
	static let md: CGFloat = 12
	static let lg: CGFloat = 16
	static let xl: CGFloat = 24
	static let xxl: CGFloat = 32
}

enum AppTypography {
	static func largeTitle(_ color: Color = AppColors.textPrimary) -> some ViewModifier {
		return FontModifier(font: .system(size: 34, weight: .bold), color: color)
	}

	static func title(_ color: Color = AppColors.textPrimary) -> some ViewModifier {
		return FontModifier(font: .system(size: 24, weight: .semibold), color: color)
	}

	static func headline(_ color: Color = AppColors.textPrimary) -> some ViewModifier {
		return FontModifier(font: .system(size: 18, weight: .semibold), color: color)
	}

	static func body(_ color: Color = AppColors.textSecondary) -> some ViewModifier {
		return FontModifier(font: .system(size: 16, weight: .regular), color: color)
	}

	static func caption(_ color: Color = AppColors.textSecondary) -> some ViewModifier {
		return FontModifier(font: .system(size: 12, weight: .medium), color: color)
	}
}

private struct FontModifier: ViewModifier {
	let font: Font
	let color: Color

	func body(content: Content) -> some View {
		content
			.font(font)
			.foregroundColor(color)
	}
}

extension View {
	func appLargeTitle(_ color: Color = AppColors.textPrimary) -> some View {
		modifier(AppTypography.largeTitle(color))
	}

	func appTitle(_ color: Color = AppColors.textPrimary) -> some View {
		modifier(AppTypography.title(color))
	}

	func appHeadline(_ color: Color = AppColors.textPrimary) -> some View {
		modifier(AppTypography.headline(color))
	}

	func appBody(_ color: Color = AppColors.textSecondary) -> some View {
		modifier(AppTypography.body(color))
	}

	func appCaption(_ color: Color = AppColors.textSecondary) -> some View {
		modifier(AppTypography.caption(color))
	}
}


