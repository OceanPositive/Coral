// The MIT License (MIT)
//
// https://github.com/DevYeom/Coral

import Foundation
import JSONFormatter
import JSONFormatterTesting
import XCTest

final class JSONFormatterTests: XCTestCase {

    func test_example() {
        JSONFormatterMock.hello()
        XCTAssertEqual("JSONFormatter", "JSONFormatter")
    }

}
