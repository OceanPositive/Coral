// The MIT License (MIT)
//
// https://github.com/DevYeom/Coral

import ColorConverterInterface
import Foundation

extension HexColor: Validatable {

    public var isValid: Bool {
        do {
            let hexColorRegex = try Regex(#"^#([A-Fa-f0-9]{6})$|^#([A-Fa-f0-9]{3})$"#)
            return value.wholeMatch(of: hexColorRegex) != nil
        } catch {
            return false
        }
    }

}
