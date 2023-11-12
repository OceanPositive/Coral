// The MIT License (MIT)
//
// https://github.com/OceanPositive/Coral

import CoralUI
import OneWay
import SwiftUI

public struct ColorConverterBuilder: ViewBuildable {
    public init() {}

    @MainActor
    public func callAsFunction(
        _ dependency: ColorConverterDependency
    ) -> AnyView {
        let store = ViewStore(
            reducer: ColorConverterReducer(),
            state: .init(
                sourceColor: .black,
                hex: HexColor(value: "#000000"),
                cmyk: CMYKColor(cyan: .zero, magenta: .zero, yellow: .zero, key: 1.0),
                hsb: HSBColor(hue: .zero, saturation: .zero, brightness: .zero)
            )
        )
        return AnyView(ColorConverterScreen(store: store))
    }
}
