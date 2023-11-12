// The MIT License (MIT)
//
// https://github.com/OceanPositive/Coral

import Foundation

extension RGBColor: ColorType {
    public var sourceColor: RGBColor {
        self
    }
}

extension RGBColor {
    static var black: RGBColor {
        RGBColor(
            red: .zero,
            green: .zero,
            blue: .zero
        )
    }
}
