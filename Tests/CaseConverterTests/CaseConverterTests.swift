// The MIT License (MIT)
//
// https://github.com/OceanPositive/Coral

import CaseConverter
import Foundation
import XCTest

final class CaseConverterTests: XCTestCase {
    func test_example() {
        CaseConverterMock.hello()
        XCTAssertEqual("CaseConverter", "CaseConverter")
    }
}
