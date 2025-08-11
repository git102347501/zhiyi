#if canImport(SwiftUI)
import SwiftUI

struct ChatView: View {
    @ObservedObject var conversation: Conversation
    @State private var inputText: String = ""
    private let service = ChatService()

    var body: some View {
        VStack {
            ScrollViewReader { proxy in
                ScrollView {
                    LazyVStack(alignment: .leading) {
                        ForEach(conversation.messages) { message in
                            HStack {
                                if message.isUser { Spacer() }
                                Text(message.text)
                                    .padding(10)
                                    .background(message.isUser ? Color.blue.opacity(0.7) : Color.gray.opacity(0.3))
                                    .foregroundColor(message.isUser ? .white : .black)
                                    .cornerRadius(8)
                                if !message.isUser { Spacer() }
                            }
                            .padding(.horizontal)
                            .id(message.id)
                        }
                    }
                }
                .onChange(of: conversation.messages.count) { _ in
                    if let last = conversation.messages.last {
                        proxy.scrollTo(last.id, anchor: .bottom)
                    }
                }
            }

            HStack {
                TextField("Message", text: $inputText)
                    .textFieldStyle(.roundedBorder)
                Button("Send", action: sendMessage)
                    .disabled(inputText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
            }
            .padding()
        }
    }

    private func sendMessage() {
        let text = inputText.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !text.isEmpty else { return }
        conversation.messages.append(Message(text: text, isUser: true))
        inputText = ""

        Task {
            await MainActor.run {
                conversation.messages.append(Message(text: "", isUser: false))
            }
            for await part in service.send(message: text) {
                await MainActor.run {
                    let index = conversation.messages.count - 1
                    conversation.messages[index].text += part
                }
            }
        }
    }
}
#endif
