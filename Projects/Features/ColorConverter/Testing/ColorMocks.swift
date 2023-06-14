// The MIT License (MIT)
//
// https://github.com/DevYeom/Coral

import ColorConverterInterface

public typealias RGBColor = ColorConverterInterface.RGBColor
public typealias HexColor = ColorConverterInterface.HexColor
public typealias CMYKColor = ColorConverterInterface.CMYKColor
public typealias HSBColor = ColorConverterInterface.HSBColor

public enum ColorMocks {

    public enum RGB {
        public static let black: RGBColor = RGBColor(red: .zero, green: .zero, blue: .zero)
        public static let white: RGBColor = RGBColor(red: 1.0, green: 1.0, blue: 1.0)
    }

    public enum Hex {
        public static let black: HexColor = HexColor(value: "#000000")
        public static let white: HexColor = HexColor(value: "#FFFFFF")
    }

    public enum CMYK {
        public static let black: CMYKColor = CMYKColor(cyan: .zero, magenta: .zero, yellow: .zero, key: 1.0)
        public static let white: CMYKColor = CMYKColor(cyan: .zero, magenta: .zero, yellow: .zero, key: .zero)
    }

    public enum HSB {
        public static let black: HSBColor = HSBColor(hue: .zero, saturation: .zero, brightness: .zero)
        public static let white: HSBColor = HSBColor(hue: .zero, saturation: .zero, brightness: 1.0)
    }

}
