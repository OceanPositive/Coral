// The MIT License (MIT)
//
// https://github.com/DevYeom/Coral

import Foundation
import XCTest
import CoralKit
import CoralKitTesting

final class CoralKitTests: XCTestCase {

    func test_example() {
        CoralKitMock.hello()
        XCTAssertEqual("CoralKit", "CoralKit")
    }

}
