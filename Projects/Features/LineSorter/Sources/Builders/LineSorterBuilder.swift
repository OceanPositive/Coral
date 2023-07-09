// The MIT License (MIT)
//
// https://github.com/DevYeom/Coral

import CoralUI
import LineSorterInterface
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
