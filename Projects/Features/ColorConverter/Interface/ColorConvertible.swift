// The MIT License (MIT)
//
// https://github.com/DevYeom/Coral

import Foundation

public protocol ColorConvertible {

    var toRGB: RGBColor { get }
    var toHex: HexColor { get }
    var toCMYK: CMYKColor { get }
    var toHSB: HSBColor { get }

}
