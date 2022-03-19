import XCTest
@testable import Semver

final class VersionTests: XCTestCase {
    func testParse() {
        let _version = Version.parse("1.3.6");
        switch _version {
        case .success(let version):
            XCTAssertEqual(1, version.major)
            XCTAssertEqual(3, version.minor)
            XCTAssertEqual(6, version.patch)
        case .failure(_):
            XCTFail()
        }
    }

    func testNeq() {
        let version = Version(major: 1, minor: 1, patch: 1)
        let other = Version(major: 2, minor: 0, patch: 5)

        XCTAssertFalse(version == other)
    }

    func testEq() {
        let version = Version(major: 1, minor: 1, patch: 5)
        let other = Version(major: 1, minor: 1, patch: 5)

        XCTAssert(version == other)
    }

    func testLesser() {
        let version = Version(major: 1, minor: 1, patch: 1)
        let other = Version(major: 2, minor: 0, patch: 5)

        XCTAssert(version < other)
    }

    func testGreater() {
        let version = Version(major: 1, minor: 1, patch: 1)
        let other = Version(major: 2, minor: 0, patch: 5)

        XCTAssert(other > version)
    }


    func testNotLesser() {
        let version = Version(major: 1, minor: 1, patch: 1)
        let other = Version(major: 2, minor: 0, patch: 5)

        XCTAssertFalse(other < version)
    }

    func testGetMajor() {
        let major: UInt64 = 10
        let version = Version(major: major, minor: 1, patch: 1)
        
        XCTAssertEqual(major, version.major)
    }
    func testGetMinor() {
        let minor: UInt64 = 10
        let version = Version(major: 1, minor: minor, patch: 1)
        
        XCTAssertEqual(minor, version.minor)
    }
    func testGetPatch() {
        let patch: UInt64 = 10
        let version = Version(major: 1, minor: 1, patch: patch)
        
        XCTAssertEqual(patch, version.patch)
    }
    func testGetPre() throws {
        let pre = try Prerelease.parse("alpha.4").get()
        let version = try Version.parse("1.0.4-alpha.4").get()

        XCTAssertEqual(pre, version.pre)
    }

    func testSetMajor() {
        var version = Version(major: 10, minor: 1, patch: 1)
        version.major = 11
        
        XCTAssertEqual(11, version.major)
    }
    func testSetMinor() {
        var version = Version(major: 1, minor: 10, patch: 1)
        version.minor = 11
        
        XCTAssertEqual(11, version.minor)
    }
    func testSetPatch() {
        var version = Version(major: 1, minor: 1, patch: 10)
        version.patch = 11
        
        XCTAssertEqual(11, version.patch)
    }
    func testSetPre() throws {
        let pre = try Prerelease.parse("beta.2").get()
        var version = try Version.parse("1.0.4-alpha.1").get()
        version.pre = pre

        XCTAssertEqual(pre, version.pre)
    }

    func testDocCreateAndParse() throws {
        let version = Version(major: 1, minor: 0, patch: 3)
        let versionParsed = try Version.parse("1.0.3").get()

        XCTAssertEqual(version, versionParsed)
    }

    func testToString() throws {
        let string = "1.5.6"
        let version = try Version.parse(string).get()

        XCTAssertEqual(string, version.toString())
    }
}
