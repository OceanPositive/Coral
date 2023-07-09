// The MIT License (MIT)
//
// https://github.com/DevYeom/Coral

import ColorConverterInterface
import CoralUI
import SwiftUI

public struct ColorConverterBuilder: ViewBuildable {

    public init() {}

    public func callAsFunction(
        _ dependency: ColorConverterDependency
    ) -> AnyView {
        let way = ColorConverterWay(
            initialState: .init(
                sourceColor: .black,
                hex: HexColor(value: "#000000"),
                cmyk: CMYKColor(cyan: .zero, magenta: .zero, yellow: .zero, key: 1.0),
                hsb: HSBColor(hue: .zero, saturation: .zero, brightness: .zero)
            )
        )
        return AnyView(ColorConverterScreen(way: way))
    }

}
