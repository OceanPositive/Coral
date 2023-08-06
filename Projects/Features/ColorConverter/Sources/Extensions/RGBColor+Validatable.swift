// The MIT License (MIT)
//
// https://github.com/OceanPositive/Coral

import ColorConverterInterface
import Foundation

extension RGBColor: Validatable {

    public var isValid: Bool {
        let range: ClosedRange<Double> = Double.zero ... 1.0
        return range.contains(red) && range.contains(green) && range.contains(blue)
    }

}
