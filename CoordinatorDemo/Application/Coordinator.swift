import SwiftUI

struct Coordinator: View {
    @ObservedObject var state: AnyObservableState<CoordinatorState>
    
    let onPathChange: ([CoordinatorState.Path]) -> Void
    
    var body: some View {
        NavigationStack(path: Binding(get: { state.path }, set: onPathChange)) {
            state.rootScene
                .navigationDestination(for: CoordinatorState.Path.self) { path in
                    switch path {
                    case .details(let scene):
                        scene
                    }
                }
        }
    }
}

class CoordinatorStore: ObservableState {
    @Published private(set) var state: CoordinatorState
    
    let makeDetailsScene: () -> DetailsScene
    
    init(
        initialState: CoordinatorState,
        makeDetailsScene: @escaping () -> DetailsScene
    ) {
        self.state = initialState
        self.makeDetailsScene = makeDetailsScene
    }
    
    func showDetails() {
        let scene = makeDetailsScene()
        let pathView = PathView(scene)
        state.path.append(.details(pathView))
    }
    
    func handlePathChange(_ path: [CoordinatorState.Path]) {
        state.path = path
    }
}

struct CoordinatorState {
    enum Path: Hashable {
        case details(PathView)
    }
    
    var rootScene: RootScene
    var path: [Path]
}
