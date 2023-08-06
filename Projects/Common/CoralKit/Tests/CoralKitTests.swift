// The MIT License (MIT)
//
// https://github.com/OceanPositive/Coral

import CoralKit
import CoralKitTesting
import Foundation
import XCTest

final class CoralKitTests: XCTestCase {

    func test_example() {
        CoralKitMock.hello()
        XCTAssertEqual("CoralKit", "CoralKit")
    }

}
