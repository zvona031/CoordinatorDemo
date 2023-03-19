import Foundation

struct Factory {
    func makeCoordinator() -> Coordinator {
        var onDetailsTap: (() -> Void)?
        let rootScene = makeRootScene(onDetailsTap: {
            onDetailsTap?()
        })
        let initialState = CoordinatorState(rootScene: rootScene, path: [])
        let store = CoordinatorStore(
            initialState: initialState,
            makeDetailsScene: makeDetailsScene
        )
        onDetailsTap = store.showDetails
        let state = AnyObservableState(store)
        
        return Coordinator(state: state, onPathChange: store.handlePathChange)
    }
    
    func makeRootScene(onDetailsTap: @escaping () -> Void) -> RootScene {
        RootScene(onDetailsTap: onDetailsTap)
    }
    
    func makeDetailsScene() -> DetailsScene {
        let initialState = DetailsState(counter: 0)
        let store = DetailsViewStore(initialState: initialState)
        let state = AnyObservableState(store)
        
        return DetailsScene(
            state: state,
            onIncrement: store.incrementCounter,
            onDecrement: store.decrementCounter
        )
    }
}
