// swift-tools-version: 6.1
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
    targets: [
        .target(
            name: "CLIlib",
        ),
        .testTarget(
            name: "CLIlibTests",
            dependencies: ["CLIlib"]),
    ]
)
