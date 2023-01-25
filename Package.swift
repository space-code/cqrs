// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CQRS",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v16),
        .watchOS(.v6),
        .tvOS(.v11),
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
            dependencies: ["CQRS", "Dip"]
        ),
    ]
)
