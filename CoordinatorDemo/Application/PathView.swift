import SwiftUI

/// This doesn't have a stable ID, is this problematic?
struct PathView: View, Hashable {
    private let content: AnyView
    private let id = UUID()
    
    init(_ content: some View) {
        self.content = AnyView(content)
    }
    
    var body: some View {
        content
    }
    
    static func == (lhs: PathView, rhs: PathView) -> Bool {
        rhs.id == lhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
