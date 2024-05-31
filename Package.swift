// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SiriWaveView",
    platforms: [.iOS(.v13), .tvOS(.v13), .macOS(.v10_15), .watchOS(.v6), .visionOS(.v1)],
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
