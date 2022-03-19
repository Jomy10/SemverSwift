import XCTest
@testable import Semver

final class VersionReqTests: XCTestCase {
    func testStarMatch() {
        let version = Version(major: 1, minor: 1, patch: 5)
        let versionReq = VersionReq.STAR

        XCTAssert(versionReq.matches(version: version))
    }

    func testParseStar() throws {
        let versionReq1 = try VersionReq.parse("*").get();
        let versionReq2 = VersionReq.STAR
        XCTAssertEqual(versionReq1, versionReq2)
    }
    
    func testMatches() {
        let req = VersionReq.parse(">1.0.1")
        let version = Version(major: 1, minor: 1, patch: 0)

        switch req {
            case .success(let vreq):
                XCTAssert(vreq.matches(version: version))
            case .failure(_):
                XCTFail()
        }
    }
    func testMatchesEqual() {
        let req = VersionReq.parse(">1.0.1")
        let version = Version(major: 1, minor: 0, patch: 1)

        switch req {
            case .success(let vreq):
                XCTAssertFalse(vreq.matches(version: version))
            case .failure(_):
                XCTFail()
        }
    }
    func testMatchesLower() {
        let req = VersionReq.parse(">1.0.1")
        let version = Version(major: 1, minor: 0, patch: 0)

        switch req {
            case .success(let vreq):
                XCTAssertFalse(vreq.matches(version: version))
            case .failure(_):
                XCTFail()
        }
    }
    func testMatchesGreaterOrEqual() {
        let req = VersionReq.parse(">=1.0.1")
        let version = Version(major: 1, minor: 0, patch: 1)

        switch req {
            case .success(let vreq):
                XCTAssert(vreq.matches(version: version))
            case .failure(_):
                XCTFail()
        }
    }
    func testMatchesMajor() {
        let req = VersionReq.parse(">=1")
        let version = Version(major: 1, minor: 0, patch: 1)

        switch req {
            case .success(let vreq):
                XCTAssert(vreq.matches(version: version))
            case .failure(_):
                XCTFail()
        }
    }
    func testMatchesMinor() {
        let req = VersionReq.parse(">=1.0")
        let version = Version(major: 1, minor: 0, patch: 1)

        switch req {
            case .success(let vreq):
                XCTAssert(vreq.matches(version: version))
            case .failure(_):
                XCTFail()
        }
    }
    func testNotMatchesMinor() {
        let req = VersionReq.parse(">=1.1")
        let version = Version(major: 1, minor: 0, patch: 1)

        switch req {
            case .success(let vreq):
                XCTAssertFalse(vreq.matches(version: version))
            case .failure(_):
                XCTFail()
        }
    }

    func testRangeMatches() throws {
        let versionReq = try VersionReq.parse(">=1.2.3, <1.8").get()
        let versionIn = try Version.parse("1.6.3").get()
        let versionOut = try Version.parse("1.8.0").get() 

        XCTAssert(versionReq.matches(version: versionIn))
        XCTAssertFalse(versionReq.matches(version: versionOut))
    }

    func testDocStarMatch() throws {    
        let versionReq = try VersionReq.parse("*").get()
        let otherVersionReq = VersionReq.STAR

        XCTAssertEqual(versionReq, otherVersionReq)

        let version = Version(major: 1, minor: 50, patch: 69)

        // Will always match
        XCTAssert(versionReq.matches(version: version))
    }

    func testDocGreaterOrEqualMatch() throws {
        let versionReq = try VersionReq.parse(">=1.0.0").get()
        let version = try Version.parse("1.0.0").get()
        let lowerVersion = try Version.parse("0.9.8").get()

        XCTAssert(
            versionReq.matches(version: version)
        )

        XCTAssertFalse(
            versionReq.matches(version: lowerVersion)
        )
    }

    func testToString() throws {
        let string = ">=1.5.6"
        let version = try VersionReq.parse(string).get()

        XCTAssertEqual(string, version.toString())
    }
}
