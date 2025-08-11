#if canImport(SwiftUI)
import SwiftUI

struct ConversationListView: View {
    @State private var conversations: [Conversation] = [Conversation(title: "Chat 1")]

    var body: some View {
        NavigationStack {
            List {
                ForEach(conversations) { convo in
                    NavigationLink(convo.title) {
                        ChatView(conversation: convo)
                    }
                }
            }
            .navigationTitle("Conversations")
            .toolbar {
                Button(action: addConversation) {
                    Image(systemName: "plus")
                }
            }
        }
    }

    private func addConversation() {
        conversations.append(Conversation(title: "Chat \(conversations.count + 1)"))
    }
}
#endif
