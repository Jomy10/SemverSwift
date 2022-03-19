// swift-tools-version:5.5.0
import PackageDescription
let package = Package(
	name: "SemverBridge",
	products: [
		.library(
			name: "SemverBridge",
			targets: ["SemverBridge"]),
	],
	dependencies: [],
	targets: [
		.binaryTarget(
			name: "Framework",
			path: "framework.xcframework"
		),
		.target(
			name: "SemverBridge",
			dependencies: ["Framework"])
	]
)
	