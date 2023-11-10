// The MIT License (MIT)
//
// https://github.com/OceanPositive/Coral

import CoralUI
import SwiftUI

public struct LineSorterBuilder: ViewBuildable {
    public init() {}

    public func callAsFunction(
        _ dependency: LineSorterDependency
    ) -> AnyView {
        let way = LineSorterWay(
            initialState: .init(
                input: "",
                output: "",
                lineSortType: .alphabetically,
                orderType: .ordered
            )
        )
        return AnyView(LineSorterScreen(way: way))
    }
}
