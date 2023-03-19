import Foundation

protocol ObservableState: ObservableObject {
    associatedtype State

    var state: State { get }
}
