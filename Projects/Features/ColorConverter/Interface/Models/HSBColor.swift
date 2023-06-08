// The MIT License (MIT)
//
// https://github.com/DevYeom/Coral

import Foundation

public struct HSBColor: Equatable {

    public var hue: Double
    public var saturation: Double
    public var brightness: Double

    public init(
        hue: Double,
        saturation: Double,
        brightness: Double
    ) {
        self.hue = hue
        self.saturation = saturation
        self.brightness = brightness
    }

    public static func == (lhs: HSBColor, rhs: HSBColor) -> Bool {
        round(lhs.hue * 360.0) == round(rhs.hue * 360.0)
            && round(lhs.saturation * 100.0) == round(rhs.saturation * 100.0)
            && round(lhs.brightness * 100.0) == round(rhs.brightness * 100.0)
    }

}
