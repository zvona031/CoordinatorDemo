import Foundation

class DetailsViewStore: ObservableState {
    @Published private(set) var state: DetailsState
    
    init(initialState: DetailsState) {
        self.state = initialState
    }
    
    func incrementCounter() {
        state._counter += 1
    }
    
    func decrementCounter() {
        state._counter -= 1
    }
}

struct DetailsState {
    fileprivate var _counter: Int
    
    var counter: String {
        _counter.description
    }
    
    init(counter: Int) {
        self._counter = counter
    }
}
