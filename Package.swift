// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "Semver",
    products: [
        .library(
            name: "Semver",
            targets: ["Semver"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Jomy10/SemverBridge", branch: "master")
    ],
    targets: [
        .target(
            name: "Semver",
            dependencies: [
                .product(name: "SemverBridge", package: "SemverBridge")
            ]),
        .testTarget(
            name: "SemverTests",
            dependencies: ["Semver"]),
    ]
)
