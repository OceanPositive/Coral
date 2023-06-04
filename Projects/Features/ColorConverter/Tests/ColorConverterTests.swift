// The MIT License (MIT)
//
// https://github.com/DevYeom/Coral

import ColorConverter
import ColorConverterTesting
import Foundation
import XCTest

final class ColorConverterTests: XCTestCase {

    func test_example() {
        ColorConverterMock.hello()
        XCTAssertEqual("ColorConverter", "ColorConverter")
    }

}
