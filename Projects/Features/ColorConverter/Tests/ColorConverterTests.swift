// The MIT License (MIT)
//
// https://github.com/DevYeom/Coral

import ColorConverter
import ColorConverterTesting
import Foundation
import XCTest

final class ColorConverterTests: XCTestCase {

    /// To avoid conflicts with AppKit.RGBColor
    private typealias RGBColor = ColorConverterTesting.RGBColor

    func test_rgb_to_hex() {
        do {
            let rgb = RGBColor(red: .zero, green: .zero, blue: .zero)
            let hex = rgb.toHex
            XCTAssertEqual(hex.value, "#000000")
        }

        do {
            let rgb = RGBColor(red: 1.0, green: 1.0, blue: 1.0)
            let hex = rgb.toHex
            XCTAssertEqual(hex.value, "#FFFFFF")
        }

        do {
            let rgb = RGBColor(red: 122.0 / 255.0, green: 126.0 / 255.0, blue: 230.0 / 255.0)
            let hex = rgb.toHex
            XCTAssertEqual(hex.value, "#7A7EE6")
        }

        do {
            let rgb = RGBColor(red: 117.0 / 255.0, green: 84.0 / 255.0, blue: 70.0 / 255.0)
            let hex = rgb.toHex
            XCTAssertEqual(hex.value, "#755446")
        }
    }

    func test_rgb_to_cmyk() {
        do {
            let rgb = RGBColor(red: .zero, green: .zero, blue: .zero)
            let cmyk = rgb.toCMYK
            let expected = CMYKColor(cyan: .zero, magenta: .zero, yellow: .zero, key: 1.0)
            XCTAssertEqual(cmyk, expected)
        }

        do {
            let rgb = RGBColor(red: 1.0, green: 1.0, blue: 1.0)
            let cmyk = rgb.toCMYK
            let expected = CMYKColor(cyan: .zero, magenta: .zero, yellow: .zero, key: .zero)
            XCTAssertEqual(cmyk, expected)
        }

        do {
            let rgb = RGBColor(red: 122.0 / 255.0, green: 126.0 / 255.0, blue: 230.0 / 255.0)
            let cmyk = rgb.toCMYK
            let expected = CMYKColor(cyan: 0.47, magenta: 0.45, yellow: .zero, key: 0.10)
            XCTAssertEqual(cmyk, expected)
        }

        do {
            let rgb = RGBColor(red: 117.0 / 255.0, green: 84.0 / 255.0, blue: 70.0 / 255.0)
            let cmyk = rgb.toCMYK
            let expected = CMYKColor(cyan: .zero, magenta: 0.28, yellow: 0.40, key: 0.54)
            XCTAssertEqual(cmyk, expected)
        }
    }

    func test_rgb_to_hsb() {
        do {
            let rgb = RGBColor(red: .zero, green: .zero, blue: .zero)
            let hsb = rgb.toHSB
            let expected = HSBColor(hue: .zero, saturation: .zero, brightness: .zero)
            XCTAssertEqual(hsb, expected)
        }

        do {
            let rgb = RGBColor(red: 1.0, green: 1.0, blue: 1.0)
            let hsb = rgb.toHSB
            let expected = HSBColor(hue: .zero, saturation: .zero, brightness: 1.0)
            XCTAssertEqual(hsb, expected)
        }

        do {
            let rgb = RGBColor(red: 122.0 / 255.0, green: 126.0 / 255.0, blue: 230.0 / 255.0)
            let hsb = rgb.toHSB
            let expected = HSBColor(hue: 0.66, saturation: 0.47, brightness: 0.90)
            XCTAssertEqual(hsb, expected)
        }

        do {
            let rgb = RGBColor(red: 117.0 / 255.0, green: 84.0 / 255.0, blue: 70.0 / 255.0)
            let hsb = rgb.toHSB
            let expected = HSBColor(hue: 0.05, saturation: 0.40, brightness: 0.46)
            XCTAssertEqual(hsb, expected)
        }
    }

    func test_hex_to_rgb() {
        do {
            let hex = HexColor(value: "#000000")
            let rgb = hex.toRGB
            let expected = RGBColor(red: .zero, green: .zero, blue: .zero)
            XCTAssertEqual(rgb, expected)
        }

        do {
            let hex = HexColor(value: "#FFFFFF")
            let rgb = hex.toRGB
            let expected = RGBColor(red: 1.0, green: 1.0, blue: 1.0)
            XCTAssertEqual(rgb, expected)
        }

        do {
            let hex = HexColor(value: "#7A7EE6")
            let rgb = hex.toRGB
            let expected = RGBColor(red: 122.0 / 255.0, green: 126.0 / 255.0, blue: 230.0 / 255.0)
            XCTAssertEqual(rgb, expected)
        }

        do {
            let hex = HexColor(value: "#755446")
            let rgb = hex.toRGB
            let expected = RGBColor(red: 117.0 / 255.0, green: 84.0 / 255.0, blue: 70.0 / 255.0)
            XCTAssertEqual(rgb, expected)
        }
    }

    func test_cmyk_to_rgb() {
        do {
            let cmyk = CMYKColor(cyan: .zero, magenta: .zero, yellow: .zero, key: 1.0)
            let rgb = cmyk.toRGB
            let expected = RGBColor(red: .zero, green: .zero, blue: .zero)
            XCTAssertEqual(rgb, expected)
        }

        do {
            let cmyk = CMYKColor(cyan: .zero, magenta: .zero, yellow: .zero, key: .zero)
            let rgb = cmyk.toRGB
            let expected = RGBColor(red: 1.0, green: 1.0, blue: 1.0)
            XCTAssertEqual(rgb, expected)
        }

        do {
            let cmyk = CMYKColor(cyan: 0.47, magenta: 0.45, yellow: .zero, key: 0.10)
            let rgb = cmyk.toRGB
            let expected = RGBColor(red: 122.0 / 255.0, green: 126.0 / 255.0, blue: 230.0 / 255.0)
            XCTAssertEqual(rgb, expected)
        }

        do {
            let cmyk = CMYKColor(cyan: .zero, magenta: 0.28, yellow: 0.40, key: 0.54)
            let rgb = cmyk.toRGB
            let expected = RGBColor(red: 117.0 / 255.0, green: 84.0 / 255.0, blue: 70.0 / 255.0)
            XCTAssertEqual(rgb, expected)
        }
    }

    func test_hsb_to_rgb() {
        do {
            let hsb = HSBColor(hue: .zero, saturation: .zero, brightness: .zero)
            let rgb = hsb.toRGB
            let expected = RGBColor(red: .zero, green: .zero, blue: .zero)
            XCTAssertEqual(rgb, expected)
        }

        do {
            let hsb = HSBColor(hue: .zero, saturation: .zero, brightness: 1.0)
            let rgb = hsb.toRGB
            let expected = RGBColor(red: 1.0, green: 1.0, blue: 1.0)
            XCTAssertEqual(rgb, expected)
        }

        do {
            let hsb = HSBColor(hue: 0.66, saturation: 0.47, brightness: 0.90)
            let rgb = hsb.toRGB
            let expected = RGBColor(red: 122.0 / 255.0, green: 126.0 / 255.0, blue: 230.0 / 255.0)
            XCTAssertEqual(rgb, expected)
        }

        do {
            let hsb = HSBColor(hue: 0.05, saturation: 0.40, brightness: 0.46)
            let rgb = hsb.toRGB
            let expected = RGBColor(red: 117.0 / 255.0, green: 84.0 / 255.0, blue: 70.0 / 255.0)
            XCTAssertEqual(rgb, expected)
        }
    }

}
