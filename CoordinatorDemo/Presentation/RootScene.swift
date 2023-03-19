import SwiftUI

struct RootScene: View {
    let onDetailsTap: () -> Void
    
    var body: some View {
        VStack {
            Text("Root View")
            Button("Go to details >", action: onDetailsTap)
        }
    }
}
