import SwiftUI

struct RootView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem { Label("Menu", systemImage: "list.dash") }
            CartView()
                .tabItem { Label("Cart", systemImage: "cart") }
            ProfileView()
                .tabItem { Label("Profile", systemImage: "person.crop.circle") }
        }
    }
}
