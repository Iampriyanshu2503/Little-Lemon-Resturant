import Foundation

// Simple persistence helpers for small demo (UserDefaults)
class Storage {
    static let shared = Storage()
    private let defaults = UserDefaults.standard

    func saveCart(_ dishes: [Dish]) {
        if let data = try? JSONEncoder().encode(dishes) {
            defaults.set(data, forKey: "cart_items_v1")
        }
    }

    func loadCart() -> [Dish] {
        guard let data = defaults.data(forKey: "cart_items_v1"),
              let dishes = try? JSONDecoder().decode([Dish].self, from: data) else {
            return []
        }
        return dishes
    }

    func saveProfile(name: String, location: String) {
        defaults.set(name, forKey: "profile_name")
        defaults.set(location, forKey: "profile_location")
    }

    func loadProfile() -> (String, String) {
        return (defaults.string(forKey: "profile_name") ?? "Little Lemon Guest", defaults.string(forKey: "profile_location") ?? "Chicago")
    }
}
