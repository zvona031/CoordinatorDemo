import Combine

@dynamicMemberLookup
final class AnyObservableState<State>: ObservableObject {
    private let wrappedObjectWillChange: () -> ObservableObjectPublisher
    private let wrappedState: () -> State

    var objectWillChange: ObservableObjectPublisher {
        wrappedObjectWillChange()
    }

    var value: State {
        wrappedState()
    }

    init<ObservableStateType: ObservableState>(
        _ store: ObservableStateType
    ) where ObservableStateType.State == State, ObservableStateType.ObjectWillChangePublisher == ObjectWillChangePublisher {
        self.wrappedObjectWillChange = { store.objectWillChange }
        self.wrappedState = { store.state }
    }
    
    subscript<Value>(dynamicMember keyPath: KeyPath<State, Value>) -> Value {
        value[keyPath: keyPath]
    }
}
