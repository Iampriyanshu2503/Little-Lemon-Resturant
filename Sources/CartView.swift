import SwiftUI

struct CartView: View {
    @EnvironmentObject var cart: CartManager
    @State private var showingCheckout = false

    var body: some View {
        NavigationView {
            VStack {
                if cart.items.isEmpty {
                    Text("Your cart is empty").foregroundColor(.secondary)
                    Spacer()
                } else {
                    List {
                        ForEach(Array(cart.items.enumerated()), id: \ .offset) { index, item in
                            HStack {
                                Image(item.imageName ?? "placeholder")
                                    .resizable().frame(width: 60, height: 60).clipShape(RoundedRectangle(cornerRadius: 8))
                                VStack(alignment: .leading) {
                                    Text(item.name).bold()
                                    Text(String(format: "₹%.2f", item.price)).font(.subheadline).foregroundColor(.secondary)
                                }
                            }
                        }
                        .onDelete(perform: cart.remove)
                    }
                    HStack {
                        Text("Total:").bold()
                        Spacer()
                        Text(String(format: "₹%.2f", cart.total)).bold()
                    }
                    .padding()
                    Button(action: { showingCheckout = true }) {
                        Text("Checkout").frame(maxWidth: .infinity).padding().background(RoundedRectangle(cornerRadius: 8).stroke()).padding(.horizontal)
                    }
                    .sheet(isPresented: $showingCheckout) {
                        CheckoutView().environmentObject(cart)
                    }
                }
            }
            .navigationTitle("Cart")
        }
    }
}
