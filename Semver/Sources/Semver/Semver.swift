import SemverBridge
// TODO: documentation for these imported types
@_exported import class SemverBridge.Prerelease
@_exported import class SemverBridge.VersionReq
@_exported import class SemverBridge.BuildMetadata

/// **SemVer version** as defined by <https://semver.org>.
///
/// # Syntax
///
/// - The major, minor, and patch numbers may be any integer 0 through u64::MAX.
///   When representing a SemVer version as a string, each number is written as
///   a base 10 integer. For example, `1.0.119`.
///
/// - Leading zeros are forbidden in those positions. For example `1.01.00` is
///   invalid as a SemVer version.
///
/// - The pre-release identifier, if present, must conform to the syntax
///   documented for ``Prerelease``.
///
/// - The build metadata, if present, must conform to the syntax documented for
///   ``BuildMetadata``.
///
/// - Whitespace is not allowed anywhere in the version.
///
/// # Total ordering
///
/// Given any two SemVer versions, one is less than, greater than, or equal to
/// the other. Versions may be compared against one another using Rust's usual
/// comparison operators.
///
/// - The major, minor, and patch number are compared numerically from left to
/// right, lexicographically ordered as a 3-tuple of integers. So for example
/// version `1.5.0` is less than version `1.19.0`, despite the fact that
/// "1.19.0" &lt; "1.5.0" as ASCIIbetically compared strings and 1.19 &lt; 1.5
/// as real numbers.
///
/// - When major, minor, and patch are equal, a pre-release version is
///   considered less than the ordinary release:&ensp;version `1.0.0-alpha.1` is
///   less than version `1.0.0`.
///
/// - Two pre-releases of the same major, minor, patch are compared by
///   lexicographic ordering of dot-separated components of the pre-release
///   string.
///
///   - Identifiers consisting of only digits are compared
///     numerically:&ensp;`1.0.0-pre.8` is less than `1.0.0-pre.12`.
///
///   - Identifiers that contain a letter or hyphen are compared in ASCII sort
///     order:&ensp;`1.0.0-pre12` is less than `1.0.0-pre8`.
///
///   - Any numeric identifier is always less than any non-numeric
///     identifier:&ensp;`1.0.0-pre.1` is less than `1.0.0-pre.x`.
///
/// Example:&ensp;`1.0.0-alpha`&ensp;&lt;&ensp;`1.0.0-alpha.1`&ensp;&lt;&ensp;`1.0.0-alpha.beta`&ensp;&lt;&ensp;`1.0.0-beta`&ensp;&lt;&ensp;`1.0.0-beta.2`&ensp;&lt;&ensp;`1.0.0-beta.11`&ensp;&lt;&ensp;`1.0.0-rc.1`&ensp;&lt;&ensp;`1.0.0`
public struct Version {
    fileprivate var _version: _VersionRefMut

    public var major: UInt64 {
        get {self._version.get_major()}
        set(val) {self._version.set_major(val)}
    }

    public var minor: UInt64 {
        get {self._version.get_minor()}
        set(val) {self._version.set_minor(val)}
    }

    public var patch: UInt64 {
        get {self._version.get_patch()}
        set(val) {self._version.set_patch(val)}
    }

    /// Create ``Version`` with an empty pre-release and build metadata.
    public init(major: UInt64, minor: UInt64, patch: UInt64) {
        self._version = _Version(major, minor, patch)
    }

    // TODO
    // public init(major: UInt64, minor: UInt64, patch: UInt64, pre: Prerelease, build: BuildMetadatata) {}

    @available(*, deprecated, message: "Causes undefined behaviour")
    private init(version: _VersionRefMut) {
        self._version = version
    }

    /// Create `Version` by parsing from string representation.
    ///
    /// # Errors
    ///
    /// Possible reasons for the parse to fail include:
    ///
    /// - `1.0` &mdash; too few numeric components. A SemVer version must have
    ///   exactly three. If you are looking at something that has fewer than
    ///   three numbers in it, it's possible it is a `VersionReq` instead (with
    ///   an implicit default `^` comparison operator).
    ///
    /// - `1.0.01` &mdash; a numeric component has a leading zero.
    ///
    /// - `1.0.unknown` &mdash; unexpected character in one of the components.
    ///
    /// - `1.0.0-` or `1.0.0+` &mdash; the pre-release or build metadata are
    ///   indicated present but empty.
    ///
    /// - `1.0.0-alpha_123` &mdash; pre-release or build metadata have something
    ///   outside the allowed characters, which are `0-9`, `A-Z`, `a-z`, `-`,
    ///   and `.` (dot).
    ///
    /// - `23456789999999999999.0.0` &mdash; overflow of a u64.
    public static func parse(_ text: String) -> Result<Version, ParseError> {
        let version_result = _Version.parse(text)
        if version_result.is_ok() {
            /// We cant pass the result to Version, because it will go out of scope and access arbitrary memory
            let result = version_result.get_version()
            let major = result.get_major()
            let minor = result.get_minor()
            let patch = result.get_patch()

            let version = Version(major: major, minor: minor, patch: patch)
            return Result.success(version)
        } else {
            return Result.failure(ParseError(description: version_result.get_error_unsafe().toString()))
        }
    }
}

extension Version: Comparable {
    public static func < (lhs: Version, rhs: Version) -> Bool {
        lhs._version.less_than(rhs._version)
    }

    public static func == (lhs: Version, rhs: Version) -> Bool {
        lhs._version.eq(rhs._version)
    }
}

/// Error parsing a SemVer version or version requirement.
public struct ParseError: Swift.Error {
    var description: String
}

extension Prerelease: CustomStringConvertible {
    public var description: String { return self.as_str().toString() }
}

extension Prerelease {
    public func toString() -> String {
        self.description
    }

    public class func getEmpty() -> Prerelease {
        return empty_prerelease();
    }
}


extension VersionReq {
    // TODO: pubvar comparator

    /// A `VersionReq` with no constraint on the version numbers it matches.
    /// Equivalent to `VersionReq::parse("*").unwrap()`.
    ///
    /// In terms of comparators this is equivalent to `>=0.0.0`.
    ///
    /// Counterintuitively a `*` VersionReq does not match every possible
    /// version number. In particular, in order for *any* `VersionReq` to match
    /// a pre-release version, the `VersionReq` must contain at least one
    /// `Comparator` that has an explicit major, minor, and patch version
    /// identical to the pre-release being matched, and that has a nonempty
    /// pre-release component. Since `*` is not written with an explicit major,
    /// minor, and patch version, and does not contain a nonempty pre-release
    /// component, it does not match any pre-release versions.
    public static var STAR: VersionReq {
        get {
            version_req_star()
        }
    }

    /// Evaluate whether the given `Version` satisfies the version requirement.
    public func matches(version: Version) -> Bool {
        version_req_matches(self, version._version)
    }

    /// Use ``VersionReq/parse`` instead
    @available(_PackageDescription, deprecated: 1.0.0, obsoleted: 1.1.0, message: "Causes undefined behaviour. Use `parse` instead")
    public static func parse_ref_mut(_ text: String) -> Result<VersionReqRefMut, ParseError> {
        let req = parse_version_req(text)

        if req.is_err() {
            return Result.failure(ParseError(description: req.get_error_unsafe().toString()))
        } else {
            return Result.success(req.get_version())
        }
    }

    /// Create `VersionReq` by parsing from string representation.
    ///
    /// # Errors
    ///
    /// Possible reasons for the parse to fail include:
    ///
    /// - `>a.b` &mdash; unexpected characters in the partial version.
    ///
    /// - `@1.0.0` &mdash; unrecognized comparison operator.
    ///
    /// - `^1.0.0, ` &mdash; unexpected end of input.
    ///
    /// - `>=1.0 <2.0` &mdash; missing comma between comparators.
    ///
    /// - `*.*` &mdash; unsupported wildcard syntax.
    public static func parse(_ text: String) -> Result<VersionReq, ParseError> {
        let req = parse_version_req(text)

        if req.is_err() {
            return Result.failure(ParseError(description: req.get_error_unsafe().toString()))
        } else {
            return Result.success(req.get_version().toOwned())
        }
    }
}

extension VersionReqRefMut {
    public func toOwned() -> VersionReq {
        version_req_mut_to_owned(self)
    }
}

extension VersionReq: CustomDebugStringConvertible {
    public var debugDescription: String { self.description }

    public var description: String { return version_req_to_string(self).toString() }

    public func toString() -> String { self.description }
}

extension VersionReq: Equatable {
    public static func == (lhs: VersionReq, rhs: VersionReq) -> Bool {
        version_req_eq(lhs, rhs)
    }
}
