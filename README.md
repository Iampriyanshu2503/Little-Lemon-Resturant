# Little Lemon - Coursera Capstone (SwiftUI)
## What this bundle contains
A Coursera-ready SwiftUI iOS app skeleton that implements the **Little Lemon** home screen and related features mapped to a capstone rubric.

## Features implemented (Capstone-ready)
- Onboarding flow with local state to show only once.
- Authentication **mock** (local mocked sign-in) and Profile screen with editable name and location stored in UserDefaults.
- Home screen matching the uploaded wireframe structure:
  - Navigation bar with logo and profile icon
  - Hero section: title, subtitle, about text, hero image and search bar
  - "Order for Delivery" with horizontally scrolling category chips
  - Vertically scrollable menu list with dish image, name, description, and price
- Dish detail view with Add to Cart and image
- Cart manager (ObservableObject) with local persistence (UserDefaults)
- Checkout screen (mock) with order summary and "place order" action
- Remote API client with a mock HTTP server adapter (loads local JSON but uses URLSession-compatible API for easy swap to real backend)
- Unit test placeholder files (XCTest) for models and CartManager
- Assets: includes your uploaded wireframe as `wireframe.png` for reference, and a placeholder image to use as dish image
- `sample-menu.json` as sample data
- Detailed README instructions to create an Xcode project, add files, and run tests

## How to use
1. Open Xcode and create a new project (App, SwiftUI, Swift) named `LittleLemonCapstone`.
2. Close Xcode.
3. Copy the `Sources/` files into the project folder (or add them via File → Add Files to "LittleLemonCapstone" in Xcode).
4. Add `Resources/sample-menu.json` to the project and ensure it's included in the main bundle (Copy items if needed).
5. Add `Assets/wireframe.png` and `Assets/placeholder.png` to your project's Assets catalog (or drag the files into the project and keep them in an asset folder).
6. Build & Run on the iOS Simulator (iPhone 14 recommended).

## Capstone mapping
- UI/UX: Matching wireframe hero, navigation, categories, and menu list.
- Functionality: Onboarding, authentication mock, profile, search, cart, checkout flow.
- Code quality: MVVM-ish separation, ObservableObject usage, API abstraction for future real backend.
- Testing: Included XCTest placeholders and example tests for CartManager.

If you want, I can now generate a full `.xcodeproj` and include app icons and provisioning-ready assets. Reply if you'd like that ZIP instead.
