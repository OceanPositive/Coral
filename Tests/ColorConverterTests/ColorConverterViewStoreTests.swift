// The MIT License (MIT)
//
// https://github.com/OceanPositive/Coral

import Foundation
import XCTest
import OneWay

@testable import ColorConverter

@MainActor
final class ColorConverterViewStoreTests: XCTestCase {
    var sut: ViewStore<ColorConverterReducer>!

    override func setUp() {
        super.setUp()
        sut = ViewStore(
            reducer: ColorConverterReducer(),
            state: .init(
                sourceColor: ColorMocks.RGB.black,
                hex: ColorMocks.Hex.black,
                cmyk: ColorMocks.CMYK.black,
                hsb: ColorMocks.HSB.black
            )
        )
    }

    override func tearDown() {
        super.tearDown()
        sut = nil
    }

    func test_setColorSource() async {


        sut.send(.setSourceColor(ColorMocks.RGB.white))

        await Task.yield()
        try! await Task.sleep(nanoseconds: NSEC_PER_MSEC)

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
