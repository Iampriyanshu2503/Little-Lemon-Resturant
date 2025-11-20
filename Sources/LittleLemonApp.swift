import SwiftUI

@main
struct LittleLemonCapstoneApp: App {
    @StateObject var cart = CartManager.shared
    @AppStorage("hasOnboarded") var hasOnboarded: Bool = false

    var body: some Scene {
        WindowGroup {
            if !hasOnboarded {
                OnboardingView {
                    hasOnboarded = true
                }
                .environmentObject(cart)
            } else {
                RootView()
                    .environmentObject(cart)
            }
        }
    }
}
