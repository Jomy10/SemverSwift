import XCTest
@testable import Semver

final class PrereleaseTests: XCTestCase {
    func testgetEmpty() {
        XCTAssert(Prerelease.EMPTY.isEmpty())
    }
    func testgetEmptyToString() {
        XCTAssertEqual("", Prerelease.EMPTY.toString())
    }
    func testToString() throws {
        let pre = try Prerelease.parse("alpha.1").get()
        let s = pre.toString()

        XCTAssertEqual("alpha.1", s)
    }
}
