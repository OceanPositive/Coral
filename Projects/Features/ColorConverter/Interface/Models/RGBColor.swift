// The MIT License (MIT)
//
// https://github.com/DevYeom/Coral

import Foundation

public struct RGBColor: Equatable {

    public var red: Double
    public var green: Double
    public var blue: Double

    public init(
        red: Double,
        green: Double,
        blue: Double
    ) {
        self.red = red
        self.green = green
        self.blue = blue
    }

    public static func == (lhs: RGBColor, rhs: RGBColor) -> Bool {
        round(lhs.red * 255.0) == round(rhs.red * 255.0)
            && round(lhs.green * 255.0) == round(rhs.green * 255.0)
            && round(lhs.blue * 255.0) == round(rhs.blue * 255.0)
    }

}
