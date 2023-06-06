// The MIT License (MIT)
//
// https://github.com/DevYeom/Coral

import ColorConverter
import ColorConverterInterface
import Dependencies
import Foundation

private enum ColorConverterKey: DependencyKey {

    static let liveValue = ColorConverterBuilder()

}

extension DependencyValues {

    public var colorConverterBuilder: ColorConverterBuilder {
        get { self[ColorConverterKey.self] }
        set { self[ColorConverterKey.self] = newValue }
    }

}
