#if canImport(SwiftUI)
import Foundation

actor ChatService {
    /// Sends a message to the backend and returns an async stream of response chunks.
    /// Replace the body of this method with real networking code that consumes a
    /// streaming API. Here we simulate a streaming response for demonstration.
    func send(message: String) -> AsyncStream<String> {
        return AsyncStream { continuation in
            // Simulate a streamed response by sending each character separately.
            Task {
                for ch in "\(message.reversed())" {
                    try? await Task.sleep(nanoseconds: 200_000_000)
                    continuation.yield(String(ch))
                }
                continuation.finish()
            }
        }
    }
}
#endif
