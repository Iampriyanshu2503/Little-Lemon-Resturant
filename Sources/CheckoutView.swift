import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var cart: CartManager
    @Environment(\ .presentationMode) var presentation

    var body: some View {
        NavigationView {
            VStack(spacing: 12) {
                List {
                    ForEach(cart.items) { item in
                        HStack {
                            Text(item.name)
                            Spacer()
                            Text(String(format: "₹%.2f", item.price))
                        }
                    }
                }
                HStack {
                    Text("Total:").bold()
                    Spacer()
                    Text(String(format: "₹%.2f", cart.total)).bold()
                }.padding()
                Button(action: {
                    // Mock placing order
                    cart.clear()
                    presentation.wrappedValue.dismiss()
                }) {
                    Text("Place Order").frame(maxWidth: .infinity).padding().background(RoundedRectangle(cornerRadius: 8).stroke()).padding(.horizontal)
                }
                Spacer()
            }
            .navigationTitle("Checkout")
        }
    }
}
