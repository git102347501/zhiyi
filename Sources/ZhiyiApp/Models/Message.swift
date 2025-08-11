#if canImport(SwiftUI)
import Foundation

struct Message: Identifiable, Hashable {
    var id = UUID()
    var text: String
    let isUser: Bool
}
#endif
