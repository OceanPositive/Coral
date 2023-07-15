// The MIT License (MIT)
//
// https://github.com/DevYeom/Coral

import CoralUI
import JSONFormatterInterface
import SwiftUI

public struct JSONFormatterBuilder: ViewBuildable {

    public init() {}

    public func callAsFunction(
        _ dependency: JSONFormatterDependency
    ) -> AnyView {
        let way = JSONFormatterWay(
            initialState: .init(
                input: "",
                output: ""
            )
        )
        return AnyView(JSONFormatterScreen(way: way))
    }

}
