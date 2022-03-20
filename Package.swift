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
        // DEBUG:
        .package(path: "../SemverSwiftBridge")
        // .package(url: "https://github.com/Jomy10/SemverBridge", branch: "master")
    ],
    targets: [
        .target(
            name: "Semver",
            dependencies: [
                // DEBUG:
                .product(name: "SemverBridge", package: "SemverSwiftBridge")
                // .product(name: "SemverBridge", package: "SemverBridge")
            ]),
        .testTarget(
            name: "SemverTests",
            dependencies: ["Semver"]),
    ]
)
