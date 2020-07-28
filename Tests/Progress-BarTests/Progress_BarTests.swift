import XCTest
@testable import Progress_Bar

final class Progress_BarTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Progress_Bar().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
