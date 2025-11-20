import SwiftUI

struct ProfileView: View {
    @State private var name: String = ""
    @State private var location: String = ""

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Profile")) {
                    TextField("Name", text: $name)
                    TextField("Location", text: $location)
                }
                Section {
                    Button("Save") {
                        Storage.shared.saveProfile(name: name, location: location)
                    }
                    Button("Reset") {
                        name = ""; location = ""
                    }
                }
            }
            .onAppear {
                let profile = Storage.shared.loadProfile()
                name = profile.0; location = profile.1
            }
            .navigationTitle("Profile")
        }
    }
}
