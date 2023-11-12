// The MIT License (MIT)
//
// https://github.com/OceanPositive/Coral

import Foundation

extension CMYKColor: Validatable {
    public var isValid: Bool {
        Double.zero ... 1.0 ~= cyan
            && Double.zero ... 1.0 ~= magenta
            && Double.zero ... 1.0 ~= yellow
            && Double.zero ... 1.0 ~= key
            && sourceColor.isValid
    }
}
