// The MIT License (MIT)
//
// https://github.com/DevYeom/Coral

import ColorConverterInterface
import Foundation

extension RGBColor: ColorType {

    public var sourceColor: RGBColor {
        self
    }

}

extension RGBColor {

    static var black: ColorConverterInterface.RGBColor {
        RGBColor(
            red: .zero,
            green: .zero,
            blue: .zero
        )
    }

}
