// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let version = Version("0.1.2")

let package = Package(
    name: "CLIlib",
    platforms: [
        .macOS(.v12)
    ],
    products: [
        .library(
            name: "CLIlib",
            targets: ["CLIlib"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-log.git", from: "1.6.0"),
    ],
    targets: [
        .target(
            name: "CLIlib",
            dependencies: [
                .product(name: "Logging", package: "swift-log")
            ]),
        .testTarget(
            name: "CLIlibTests",
            dependencies: ["CLIlib"]),
    ],
    swiftLanguageModes: [.v5]
)
