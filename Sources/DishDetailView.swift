import SwiftUI

struct DishDetailView: View {
    let dish: Dish
    @EnvironmentObject var cart: CartManager
    @State private var quantity = 1

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                Image(dish.imageName ?? "placeholder")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 260)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                VStack(alignment: .leading, spacing: 10) {
                    Text(dish.name).font(.title).bold()
                    Text(dish.description).foregroundColor(.secondary)
                    HStack {
                        Stepper("Qty: \(quantity)", value: $quantity, in: 1...10)
                        Spacer()
                        Text(String(format: "₹%.2f", dish.price * Double(quantity))).font(.title2).bold()
                    }
                    Button(action: {
                        for _ in 0..<quantity { cart.add(dish) }
                    }) {
                        Text("Add to cart").frame(maxWidth: .infinity).padding().background(RoundedRectangle(cornerRadius: 8).stroke())
                    }
                }
                .padding(.horizontal)
                Spacer()
            }
        }
        .navigationTitle(dish.name)
    }
}
