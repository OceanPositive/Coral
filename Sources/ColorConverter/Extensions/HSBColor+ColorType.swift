// The MIT License (MIT)
//
// https://github.com/OceanPositive/Coral

import AppKit
import Foundation

extension HSBColor: ColorType {
    public var sourceColor: RGBColor {
        let nsColor = NSColor(
            hue: hue,
            saturation: saturation,
            brightness: brightness,
            alpha: 1.0
        )
        var red: CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat = 0.0
        var alpha: CGFloat = 0.0
        nsColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        return RGBColor(
            red: red,
            green: green,
            blue: blue
        )
    }
}
