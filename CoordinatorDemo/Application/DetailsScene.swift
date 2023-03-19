import SwiftUI

struct DetailsScene: View {
    @ObservedObject var state: AnyObservableState<DetailsState>
    
    let onIncrement: () -> Void
    let onDecrement: () -> Void
    
    var body: some View {
        DetailsView(state: state.value, onIncrement: onIncrement, onDecrement: onDecrement)
    }
}
