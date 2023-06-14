// The MIT License (MIT)
//
// https://github.com/DevYeom/Coral

import ColorConverterInterface
import CoralKit
import SwiftUI

public struct ColorConverterBuilder: Buildable {

    public init() {}

    public func callAsFunction(
        _ dependency: ColorConverterDependency
    ) -> ColorConverterScreen {
        let way = ColorConverterWay(
            initialState: .init(
                sourceColor: .black,
                hex: HexColor(value: "#000000"),
                cmyk: CMYKColor(cyan: .zero, magenta: .zero, yellow: .zero, key: 1.0),
                hsb: HSBColor(hue: .zero, saturation: .zero, brightness: .zero)
            )
        )
        return ColorConverterScreen(way: way)
    }

}
