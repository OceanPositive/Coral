// The MIT License (MIT)
//
// https://github.com/DevYeom/Coral

import ColorConverterTesting
import Foundation
import XCTest

@testable import ColorConverter

final class ColorConverterWayTests: XCTestCase {

    var sut: ColorConverterWay!

    override func setUp() {

    }

    func test_setColorSource() {
        sut = ColorConverterWay(
            initialState: .init(
                sourceColor: ColorMocks.RGB.black,
                hex: ColorMocks.Hex.black,
                cmyk: ColorMocks.CMYK.black,
                hsb: ColorMocks.HSB.black
            )
        )

        sut.send(.setSourceColor(ColorMocks.RGB.white))

        XCTAssertEqual(sut.state.isValidRGB, true)
        XCTAssertEqual(sut.state.isValidHex, true)
        XCTAssertEqual(sut.state.isValidCMYK, true)
        XCTAssertEqual(sut.state.isValidHSB, true)

        XCTAssertEqual(sut.state.sourceColor, ColorMocks.RGB.white)
        XCTAssertEqual(sut.state.hex, ColorMocks.Hex.white)
        XCTAssertEqual(sut.state.cmyk, ColorMocks.CMYK.white)
        XCTAssertEqual(sut.state.hsb, ColorMocks.HSB.white)
    }

}
