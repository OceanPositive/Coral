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
                test: "\(dependency.text) Hello World!"
            )
        )
        return ColorConverterScreen(way: way)
    }

}
