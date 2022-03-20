import XCTest
@testable import Semver


final class ComparatorTests: XCTestCase {
    func testParse() throws {
        let comparator = try Comparator.parse(">1.0.4-alpha.4").get()

        XCTAssertEqual(Operator.Greater, comparator.op)
        XCTAssertEqual(1, comparator.major)
        XCTAssertEqual(0, comparator.minor!)
        XCTAssertEqual(4, comparator.patch!)
        XCTAssertEqual(try Prerelease.parse("alpha.4").get(), comparator.pre)
    }

    func testSetMajor() throws {
        let comparator = try Comparator.parse(">1.0.4-alpha.4").get()
        comparator.major = 6
        XCTAssertEqual(6, comparator.major)
    }
    func testSetMinor() throws {
        let comparator = try Comparator.parse(">1.0.4-alpha.4").get()
        comparator.minor = 6
        XCTAssertEqual(6, comparator.minor!)
    }
    func testSetPatch() throws {
        let comparator = try Comparator.parse(">1.0.4-alpha.4").get()
        comparator.patch = 6
        XCTAssertEqual(6, comparator.patch!)
    }
    func testSetPre() throws {
        let comparator = try Comparator.parse(">1.0.4-alpha.4").get()
        let pre = try Prerelease.parse("beta.5").get()
        comparator.pre = pre
        XCTAssertEqual(pre, comparator.pre)
    }
    func testSetOperator() throws {
        let comparator = try Comparator.parse(">1.0.4-alpha.4").get()
        comparator.op = Operator.Less
        XCTAssertEqual(Operator.Less, comparator.op)
    }

    func testMatches() throws {
        let comparator = try Comparator.parse(">=1").get()
        let version = try Version.parse("1.0.0").get()
        let otherVersion = try Version.parse("10.0.1").get()

        XCTAssert(comparator.matches(version: version))
        XCTAssert(comparator.matches(version: otherVersion))
    }
}
