// The MIT License (MIT)
//
// https://github.com/DevYeom/Coral

import AppKit
import ColorConverterInterface
import Foundation

extension ColorConverterInterface.RGBColor {

    static var black: ColorConverterInterface.RGBColor {
        RGBColor(
            red: .zero,
            green: .zero,
            blue: .zero
        )
    }

}

extension ColorConverterInterface.RGBColor: ColorConvertible {

    public var toRGB: ColorConverterInterface.RGBColor {
        self
    }

    /// https://stackoverflow.com/a/58593314
    public var toHex: HexColor {
        HexColor(
            value: String(
                format: "#%02X%02X%02X",
                Int(red * 255.0),
                Int(green * 255.0),
                Int(blue * 255.0)
            )
        )
    }

    /// https://github.com/bennyguitar/Colours
    public var toCMYK: CMYKColor {
        let cyan = 1.0 - red
        let magenta = 1.0 - green
        let yellow = 1.0 - blue

        let key = min(1.0, min(cyan, min(yellow, magenta)))
        if key == 1.0 {
            return CMYKColor(
                cyan: .zero,
                magenta: .zero,
                yellow: .zero,
                key: 1.0
            )
        }

        let transform: (Double) -> Double = { value in
            return (value - key) / (1.0 - key)
        }
        return CMYKColor(
            cyan: transform(cyan),
            magenta: transform(magenta),
            yellow: transform(yellow),
            key: key
        )
    }

    public var toHSB: HSBColor {
        let nsColor = NSColor(
            red: red,
            green: green,
            blue: blue,
            alpha: 1.0
        )
        var hue: CGFloat = 0.0
        var saturation: CGFloat = 0.0
        var brightness: CGFloat = 0.0
        var alpha: CGFloat = 0.0
        nsColor.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)

        return HSBColor(
            hue: hue,
            saturation: saturation,
            brightness: brightness
        )
    }

}
