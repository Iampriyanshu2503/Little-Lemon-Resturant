import SwiftUI

struct DishRow: View {
    let dish: Dish

    var body: some View {
        HStack(spacing: 12) {
            Image(dish.imageName ?? "placeholder")
                .resizable()
                .frame(width: 70, height: 70)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            VStack(alignment: .leading, spacing: 6) {
                Text(dish.name).font(.headline)
                Text(dish.description).font(.subheadline).foregroundColor(.secondary).lineLimit(2)
                HStack {
                    Text(String(format: "₹%.2f", dish.price)).font(.subheadline).bold()
                    if dish.isVegetarian == true { Text("🌿") }
                }
            }
            Spacer()
        }
        .padding(.vertical, 8)
    }
}
