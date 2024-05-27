// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SiriWaveView",
    platforms: [.iOS(.v17), .tvOS(.v17), .macOS(.v14), .watchOS(.v10), .visionOS(.v1)],
    products: [
        .library(
            name: "SiriWaveView",
            targets: ["SiriWaveView"]),
    ],
    targets: [
        .target(
            name: "SiriWaveView"),
    ]
)
