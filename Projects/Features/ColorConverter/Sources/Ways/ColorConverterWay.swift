// The MIT License (MIT)
//
// https://github.com/DevYeom/Coral

import ColorConverterInterface
import Foundation
import OneWay

final class ColorConverterWay: Way<ColorConverterWay.Action, ColorConverterWay.State> {

    enum Action {
        case setSourceColor(RGBColor)
        case setRed(Double)
        case setGreen(Double)
        case setBlue(Double)
        case setHex(String)
        case setCyan(Double)
        case setMagenta(Double)
        case setYellow(Double)
        case setKey(Double)
        case setHue(Double)
        case setSaturation(Double)
        case setBrightness(Double)
    }

    struct State: Equatable {
        var sourceColor: RGBColor
        var hex: HexColor
        var cmyk: CMYKColor
        var hsb: HSBColor

        var red: Double { sourceColor.red }
        var green: Double { sourceColor.green }
        var blue: Double { sourceColor.blue }

        var isValidRGB: Bool { sourceColor.isValid }
        var isValidHex: Bool { hex.isValid }
        var isValidCMYK: Bool { cmyk.isValid }
        var isValidHSB: Bool { hsb.isValid }
    }

    override func reduce(state: inout State, action: Action) -> SideWay<Action, Never> {
        switch action {
        case .setSourceColor(let sourceColor):
            state.sourceColor = sourceColor
            state.hex = sourceColor.toHex
            state.cmyk = sourceColor.toCMYK
            state.hsb = sourceColor.toHSB
            return .none

        case .setRed(let red):
            state.sourceColor.red = red
            guard state.sourceColor.isValid else {
                return .none
            }
            return .just(.setSourceColor(state.sourceColor))

        case .setGreen(let green):
            state.sourceColor.green = green
            guard state.sourceColor.isValid else {
                return .none
            }
            return .just(.setSourceColor(state.sourceColor))

        case .setBlue(let blue):
            state.sourceColor.blue = blue
            guard state.sourceColor.isValid else {
                return .none
            }
            return .just(.setSourceColor(state.sourceColor))

        case .setHex(let hex):
            guard hex.hasPrefix("#") else {
                return .just(.setHex("#" + hex))
            }
            guard hex.count < 8 else {
                let prefix = String(hex.prefix(7))
                return .just(.setHex(prefix))
            }

            let hexColor = HexColor(value: hex)
            state.hex = hexColor
            guard hexColor.isValid else {
                return .none
            }
            return .just(.setSourceColor(hexColor.sourceColor))

        case .setCyan(let cyan):
            state.cmyk.cyan = cyan / 100.0
            guard state.cmyk.isValid else {
                return .none
            }
            return .just(.setSourceColor(state.cmyk.sourceColor))

        case .setMagenta(let magenta):
            state.cmyk.magenta = magenta / 100.0
            guard state.cmyk.isValid else {
                return .none
            }
            return .just(.setSourceColor(state.cmyk.sourceColor))

        case .setYellow(let yellow):
            state.cmyk.yellow = yellow / 100.0
            guard state.cmyk.isValid else {
                return .none
            }
            return .just(.setSourceColor(state.cmyk.sourceColor))

        case .setKey(let key):
            state.cmyk.key = key / 100.0
            guard state.cmyk.isValid else {
                return .none
            }
            return .just(.setSourceColor(state.cmyk.sourceColor))

        case .setHue(let hue):
            state.hsb.hue = hue
            guard state.hsb.isValid else {
                return .none
            }
            return .just(.setSourceColor(state.hsb.sourceColor))

        case .setSaturation(let saturation):
            state.hsb.saturation = saturation
            guard state.hsb.isValid else {
                return .none
            }
            return .just(.setSourceColor(state.hsb.sourceColor))

        case .setBrightness(let brightness):
            state.hsb.brightness = brightness
            guard state.hsb.isValid else {
                return .none
            }
            return .just(.setSourceColor(state.hsb.sourceColor))
        }
    }

}
