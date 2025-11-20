import Foundation
import SwiftUI

struct Dish: Identifiable, Codable, Equatable {
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageName: String?
    let isVegetarian: Bool?
}

struct MenuResponse: Codable {
    let dishes: [Dish]
}
