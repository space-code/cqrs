// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CQRS",
    platforms: [
        .macOS(.v13),
        .iOS(.v16),
        .watchOS(.v9),
        .tvOS(.v16),
    ],
    products: [
        .library(
            name: "CQRS",
            targets: ["CQRS"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/AliSoftware/Dip", .upToNextMajor(from: "7.1.1")),
    ],
    targets: [
        .target(
            name: "CQRS",
            dependencies: ["Dip"]
        ),
        .testTarget(
            name: "CQRSTests",
            dependencies: ["CQRS"]
        ),
    ]
)
