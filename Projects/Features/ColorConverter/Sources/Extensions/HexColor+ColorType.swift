// The MIT License (MIT)
//
// https://github.com/DevYeom/Coral

import ColorConverterInterface
import Foundation

extension HexColor: ColorType {

    /// https://www.hackingwithswift.com/example-code/uicolor/how-to-convert-a-hex-color-to-a-uicolor
    public var sourceColor: RGBColor {
        let startIndex = value.index(value.startIndex, offsetBy: 1)
        let hexColor = String(value[startIndex...])
        let scanner = Scanner(string: hexColor)
        var hexNumber: UInt64 = 0

        if scanner.scanHexInt64(&hexNumber) {
            let colorSource = RGBColor(
                red: Double((hexNumber & 0xff0000) >> 16) / 255.0,
                green: Double((hexNumber & 0x00ff00) >> 8) / 255.0,
                blue: Double(hexNumber & 0x0000ff) / 255.0
            )
            return colorSource
        }
        assertionFailure("The input for hex to rgb conversion is incorrect: \(value)")
        return .black
    }

}
