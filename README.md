# Semver

![version](https://img.shields.io/github/v/release/jomy10/SemverSwift?style=for-the-badge)
![tests](https://img.shields.io/github/workflow/status/jomy10/SemverSwift/Swift?label=Tests&logo=Swift&style=for-the-badge)

A package for parsing and evaluating semantic versioning in Swift.

This is a binding to [semver](https://docs.rs/semver/latest/semver/index.html), which uses Cargo's flavor of semantic versioning. See [semver's README](https://github.com/dtolnay/semver/blob/master/README.md#scope-of-this-crate) for more information.

Bridge between Rust and Swift is generated using [Swift Bridge](https://github.com/chinedufn/swift-bridge).

## Installation

### Swift Package Manager

In your `Package.swift`
```swift
dependencies: [
    .package(url: "https://github.com/jomy10/SemverSwift", from: "1.0.0")
],
targets: [
    .target(
        name: "YourTarget",
        dependencies: [
            .product(name: "Semver", package: "SemverSwift")
        ]
    )
]
```

### XCode

- [Instructions on adding a package to your XCode project (brief)](https://github.com/twostraws/SamplePackage)
  - Replace the url they ask you to put in with [`https://github.com/jomy10/SemverSwift`](https://github.com/jomy10/SemverSwift)

- [Othernstructions on adding a package to your XCode project](https://cocoacasts.com/xcode-fundamentals-how-to-add-a-swift-package-to-a-project). 

## Examples

### Creating and parsing a new Version
```swift
let version = Version(major: 1, minor: 0, patch: 3)
let versionParsed = try Version.parse("1.0.3").get()

XCTAssertEqual(version, versionParsed)
```

Of course in an actual application, you might want to implement some bother error handling such as `guard` or `switch`;

```swift
let versionParsedResult = Version.parse("1.0.3")
guard case .success(let versionParsed) = versionParsedResult else {
    XCTFail()
}
```

### Version requirements

You can test if a version matches a specific version requirement using the `VersionReq.match` method:

```swift
let versionReq = try VersionReq.parse(">=1.0.0").get()
let version = try Version.parse("1.0.0").get()
let lowerVersion = try Version.parse("0.9.8").get()

XCTAssert(
    versionReq.matches(version: version)
)

XCTAssertFalse(
    versionReq.matches(version: lowerVersion)
)
```

The `*` operator matches any version:

```swift
let versionReq = try VersionReq.parse("*").get()
let otherVersionReq = VersionReq.STAR

XCTAssertEqual(versionReq, otherVersionReq)

let version = Version(major: 1, minor: 50, patch: 69)

// Will always match
XCTAssert(versionReq.matches(version: version))
```

You can also define ranges:
```swift
let versionReq = try VersionReq.parse(">=1.2.3, <1.8").get()
let versionIn = try Version.parse("1.6.3").get()
let versionOut = try Version.parse("1.8.0").get()

XCTAssert(versionReq.matches(version: versionIn))
XCTAssertFalse(versionReq.matches(version: versionOut))
```

## Platform support

The package currently supports *macOS*, *iOS* and *iOS Simulator*. 

Support for *Linux* is possible if you compile your program using `swiftc`. 
More information can be found in the [`Swift Bridge` documentation](https://chinedufn.github.io/swift-bridge/building/swiftc-and-cargo/index.html).
In this case, it will boil down to copying the files in the `generated` folder (after building) and copying the `semver.swift` file
in the `Semver` package to a your project (and removing the import statements, except for Foundation). Then also copying
the static library obtained using `cargo build --target {linux-target}`. After that, compile your program with `switc` according
to the Swift Bridge documentation. If you need Linux support, feel free to open an issue and I will guide you through the process
and write a more thorough documentation.

Support for other Apple platforms has not been tested, but we will probably need to compile Rust to those platforms,
there is no official support for the other Apple platforms yet however.

## Project structure

This project is divided into 3 repositories. This is because (sadly), we cannot have multiple Swift Packages in the same repository and they cannot be subdirectories.

### [SemverSwiftBridgeRs](https://github.com/Jomy10/SemverSwiftBridgeRS)/`src`
This directory contains the Rust source files that bridge the Rust `semver` package to Swift using `swift-bridge`.

### [`SemverBridge`](https://github.com/Jomy10/SemverBridge)
This is the package generated by Swift Bridge.

### [`SemverSwift`](https://github.com/Jomy10/SemverSwift)
This is the package that further refines the generated package for Swift, providing a nicer public API.

## Building from source

Copy the 3 repositories:
```bash
git clone https://github.com/Jomy10/SemverSwiftBridgeRS
git clone https://github.com/Jomy10/SemverBridge
git clone https://github.com/Jomy10/SemverSwift
```

To create a Swift package from the Rust source files, you will need to have the `swift-bridge-cli` installed:

```bash
cargo install -f swift-bridge-cli
```

To build the project for *macOS*, *iOS*, and *iOS Simulator*, run the following:

```bash
cd SemverSwiftBrigeRs
./build.sh RELEASE
```

This will build the `SemverBridge` package.

To build a debug version for *macOS*, run:

```bash
./build.sh
// or
./build.sh DEBUG
```

*If you use bash, or any other shell than zsh, you can change the interpreter at the top of the `build.sh` file.*

## Running tests

To run the tests:
```bash
# This repository
cd SemverSwift

swift test
```

## Roadmap

This project will follow updates of [semver](https://docs.rs/semver/latest/semver/index.html). The current version is `1.0.6`.

### Unimplemented features

A number of features are currently unimplemented and are planned to be implemented soon (help is appreciated).

- `Prerelease`
- `BuildMetadata`
- A number of minor methods on `Version`

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md).

## License
This package is dual licensed under *Apache 2.0* and *MIT* licenses, just like the original crate. 

[See licenses](LICENSE).
