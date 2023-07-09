// The MIT License (MIT)
//
// https://github.com/DevYeom/Coral

import ColorConverter
import ColorConverterInterface
import CoralUI
import Factory
import Foundation

public final class ColorConverterContainer: SharedContainer {

    public static let shared = ColorConverterContainer()
    public let manager = ContainerManager()

}

extension ColorConverterContainer {

    public var colorConverterBuilder: Factory<AnyViewBuilder<ColorConverterDependency>> {
        self { AnyViewBuilder(ColorConverterBuilder()) }
    }

}
