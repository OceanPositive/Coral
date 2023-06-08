// The MIT License (MIT)
//
// https://github.com/DevYeom/Coral

import ColorConverterInterface
import Foundation

extension CMYKColor: ColorConvertible {

    /// https://github.com/bennyguitar/Colours
    public var toRGB: RGBColor {
        let transform: (Double) -> Double = { value in
            1.0 - (value * (1.0 - key) + key)
        }
        return RGBColor(
            red: transform(cyan),
            green: transform(magenta),
            blue: transform(yellow)
        )
    }

    public var toHex: HexColor {
        toRGB.toHex
    }

    public var toCMYK: CMYKColor {
        self
    }

    public var toHSB: HSBColor {
        toRGB.toHSB
    }

}
