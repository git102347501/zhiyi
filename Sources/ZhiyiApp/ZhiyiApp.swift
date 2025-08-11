#if canImport(SwiftUI)
import SwiftUI

@main
struct ZhiyiApp: App {
    var body: some Scene {
        TabView {
            ConversationListView()
                .tabItem {
                    Label("Chats", systemImage: "message")
                }

            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}
#endif
