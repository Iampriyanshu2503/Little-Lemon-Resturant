import SwiftUI

struct OnboardingView: View {
    var onComplete: () -> Void

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Image("wireframe")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 220)
                    .cornerRadius(12)
                Text("Welcome to Little Lemon").font(.largeTitle).bold()
                Text("A Coursera Capstone demo — beautifully crafted SwiftUI app matching your wireframe and required features.").multilineTextAlignment(.center).padding()
                Spacer()
                Button(action: onComplete) {
                    Text("Get Started").bold().frame(maxWidth: .infinity).padding().background(RoundedRectangle(cornerRadius: 10).stroke()).padding(.horizontal)
                }
            }
            .padding()
            .navigationBarHidden(true)
        }
    }
}
