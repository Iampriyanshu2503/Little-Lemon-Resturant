import SwiftUI

struct HomeView: View {
    @State private var dishes: [Dish] = []
    @State private var search = ""
    @State private var selectedCategory: String? = nil
    @EnvironmentObject var cart: CartManager
    private let api: APIServiceProtocol = MockAPIService()

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                HeroSection(search: $search)
                Divider()
                ScrollView(.vertical, showsIndicators: true) {
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Order for Delivery").font(.headline).padding(.horizontal)
                        CategoryScroll(selected: $selectedCategory)
                            .padding(.horizontal)
                        LazyVStack(spacing: 0) {
                            ForEach(filteredDishes) { dish in
                                NavigationLink(destination: DishDetailView(dish: dish).environmentObject(cart)) {
                                    DishRow(dish: dish)
                                }
                                .buttonStyle(PlainButtonStyle())
                                Divider()
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: Image(systemName: "leaf.fill").imageScale(.large), trailing: NavigationLink(destination: ProfileView()) { Image(systemName: "person.crop.circle") })
            .onAppear {
                api.fetchMenu { result in
                    switch result {
                    case .success(let list): self.dishes = list
                    case .failure(let err): print("Failed to load menu:\(err)")
                    }
                }
            }
        }
    }

    var filteredDishes: [Dish] {
        var list = dishes
        if let cat = selectedCategory, !cat.isEmpty {
            list = list.filter { $0.name.localizedCaseInsensitiveContains(cat) || $0.description.localizedCaseInsensitiveContains(cat) }
        }
        if !search.isEmpty {
            list = list.filter { $0.name.localizedCaseInsensitiveContains(search) || $0.description.localizedCaseInsensitiveContains(search) }
        }
        return list
    }
}

struct HeroSection: View {
    @Binding var search: String
    var body: some View {
        VStack(spacing: 12) {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 6) {
                    Text("Little lemon").font(.title).bold()
                    Text("Chicago").font(.subheadline).foregroundColor(.secondary)
                    Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.").font(.footnote).foregroundColor(.secondary).padding(.top, 6)
                }
                Spacer()
                Image("placeholder").resizable().frame(width: 110, height: 110).clipShape(RoundedRectangle(cornerRadius: 12))
            }
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Search dishes...", text: $search)
            }
            .padding(8)
            .background(RoundedRectangle(cornerRadius: 8).fill(Color(.secondarySystemBackground)))
            .padding(.horizontal)
        }
        .padding(.vertical)
        .padding(.horizontal, 6)
    }
}

struct CategoryScroll: View {
    @Binding var selected: String?
    let categories = ["All","Lemon","Paneer","Chicken","Salad","Drinks"]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(categories, id: \ .self) { cat in
                    Button(action: { selected = (cat == "All") ? nil : cat }) {
                        Text(cat).padding(.vertical, 8).padding(.horizontal, 14).background(RoundedRectangle(cornerRadius: 10).stroke())
                    }
                }
            }
        }
    }
}
