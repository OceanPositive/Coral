// The MIT License (MIT)
//
// https://github.com/DevYeom/Coral

import ColorConverterInterface
import Foundation

extension HSBColor: Validatable {

    public var isValid: Bool {
        Double.zero ... 1.0 ~= hue
            && Double.zero ... 1.0 ~= saturation
            && Double.zero ... 1.0 ~= brightness
            && sourceColor.isValid
    }

}
