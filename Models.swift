//
//  Models.swift
//  CoffeeShop
//

import Foundation
import SwiftUI

struct Product: Identifiable, Hashable {
	let id: UUID = UUID()
	let name: String
	let subtitle: String
	let price: Double
	let rating: Double
	let imageName: String? // placeholder for asset names
	let isFeatured: Bool
}

enum SampleData {
	static let products: [Product] = [
		Product(name: "Cappuccino", subtitle: "With Oat Milk", price: 4.5, rating: 4.8, imageName: nil, isFeatured: true),
		Product(name: "Latte", subtitle: "Vanilla", price: 4.2, rating: 4.7, imageName: nil, isFeatured: true),
		Product(name: "Espresso", subtitle: "Double Shot", price: 3.0, rating: 4.6, imageName: nil, isFeatured: false),
		Product(name: "Mocha", subtitle: "Dark Chocolate", price: 4.8, rating: 4.9, imageName: nil, isFeatured: false),
		Product(name: "Americano", subtitle: "Hot", price: 3.5, rating: 4.5, imageName: nil, isFeatured: false),
	]
}


