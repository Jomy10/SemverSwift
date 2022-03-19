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
        .package(path: "SemverSwiftBridge")
    ],
    targets: [
        .target(
            name: "Semver",
            dependencies: [
                .product(name: "SemverBridge", package: "SemverSwiftBridge")
            ]),
        .testTarget(
            name: "SemverTests",
            dependencies: ["Semver"]),
    ]
)
