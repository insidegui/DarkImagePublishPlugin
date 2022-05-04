// swift-tools-version:5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DarkImagePublishPlugin",
    platforms: [.macOS(.v12)],
    products: [
        .library(
            name: "DarkImagePublishPlugin",
            targets: ["DarkImagePublishPlugin"]),
    ],
    dependencies: [
        .package(url: "https://github.com/johnsundell/publish.git", from: "0.9.0"),
    ],
    targets: [
        .target(
            name: "DarkImagePublishPlugin",
            dependencies: ["Publish"]),
        .testTarget(
            name: "DarkImagePublishPluginTests",
            dependencies: ["DarkImagePublishPlugin"]),
    ]
)
