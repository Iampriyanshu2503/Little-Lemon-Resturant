import XCTest
@testable import LittleLemonCapstone

final class CartManagerTests: XCTestCase {
    func testAddAndTotal() {
        let cart = CartManager.shared
        cart.clear()
        let dish = Dish(id: 999, name: "Test", description: "t", price: 10.0, imageName: nil, isVegetarian: nil)
        cart.add(dish)
        XCTAssertEqual(cart.items.count, 1)
        XCTAssertEqual(cart.total, 10.0)
    }
}
