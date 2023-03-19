import SwiftUI

struct DetailsView: View {
    let state: DetailsState
    
    let onIncrement: () -> Void
    let onDecrement: () -> Void
    
    var body: some View {
        HStack(spacing: 16) {
            Button("-", action: onDecrement)
                .buttonStyle(.borderedProminent)
            Text(state.counter)
                .font(.title)
            Button("+", action: onIncrement)
                .buttonStyle(.borderedProminent)
        }
    }
}
