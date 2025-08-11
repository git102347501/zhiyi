#if canImport(SwiftUI)
import Foundation

@MainActor
class Conversation: ObservableObject, Identifiable {
    let id = UUID()
    @Published var title: String
    @Published var messages: [Message] = []

    init(title: String) {
        self.title = title
    }
}
#endif
