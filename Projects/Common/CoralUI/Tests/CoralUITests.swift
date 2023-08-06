// The MIT License (MIT)
//
// https://github.com/OceanPositive/Coral

import CoralUI
import CoralUITesting
import Foundation
import XCTest

final class CoralUITests: XCTestCase {

    func test_example() {
        CoralUIMock.hello()
        XCTAssertEqual("CoralUI", "CoralUI")
    }

}
