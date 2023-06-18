// The MIT License (MIT)
//
// https://github.com/DevYeom/Coral

import ColorConverterInterface
import Foundation

extension CMYKColor: ColorType {

    public var sourceColor: RGBColor {
        let transform: (Double) -> Double = { value in
            1.0 - (value * (1.0 - key) + key)
        }
        return RGBColor(
            red: transform(cyan),
            green: transform(magenta),
            blue: transform(yellow)
        )
    }

}
