// The MIT License (MIT)
//
// https://github.com/DevYeom/Coral

import Foundation

public struct CMYKColor: Equatable {

    public var cyan: Double
    public var magenta: Double
    public var yellow: Double
    public var key: Double

    public init(
        cyan: Double,
        magenta: Double,
        yellow: Double,
        key: Double
    ) {
        self.cyan = cyan
        self.magenta = magenta
        self.yellow = yellow
        self.key = key
    }

    public static func == (lhs: CMYKColor, rhs: CMYKColor) -> Bool {
        round(lhs.cyan * 100.0) == round(rhs.cyan * 100.0)
            && round(lhs.magenta * 100.0) == round(rhs.magenta * 100.0)
            && round(lhs.yellow * 100.0) == round(rhs.yellow * 100.0)
            && round(lhs.key * 100.0) == round(rhs.key * 100.0)
    }

}
