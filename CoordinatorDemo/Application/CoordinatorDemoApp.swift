import SwiftUI

@main
struct CoordinatorDemoApp: App {
    let coordinator: Coordinator
    
    init() {
        let factory = Factory()
        coordinator = factory.makeCoordinator()
    }
    
    var body: some Scene {
        WindowGroup {
            coordinator
        }
    }
}
