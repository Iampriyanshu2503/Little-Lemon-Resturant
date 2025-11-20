import Foundation
import Combine

class CartManager: ObservableObject {
    static let shared = CartManager()
    @Published private(set) var items: [Dish] = [] {
        didSet { Storage.shared.saveCart(items) }
    }

    private init() {
        self.items = Storage.shared.loadCart()
    }

    var total: Double { items.reduce(0) { $0 + $1.price } }

    func add(_ dish: Dish) {
        items.append(dish)
    }

    func remove(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }

    func clear() {
        items.removeAll()
    }
}
