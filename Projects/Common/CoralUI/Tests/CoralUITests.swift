// The MIT License (MIT)
//
// https://github.com/DevYeom/Coral

import Foundation
import XCTest
import CoralUI
import CoralUITesting

final class CoralUITests: XCTestCase {

    func test_example() {
        CoralUIMock.hello()
        XCTAssertEqual("CoralUI", "CoralUI")
    }

}
