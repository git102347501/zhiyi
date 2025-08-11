// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ZhiyiApp",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .executable(
            name: "ZhiyiApp",
            targets: ["ZhiyiApp"]
        )
    ],
    targets: [
        // The main application target.  Files inside `Sources/ZhiyiApp` build on Apple
        // platforms, while conditional compilation keeps the Linux build working so we
        // can run basic checks in this environment.
        .executableTarget(
            name: "ZhiyiApp"
        )
    ],
    swiftLanguageModes: [.v6]
)
