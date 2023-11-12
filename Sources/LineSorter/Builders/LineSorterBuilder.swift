// The MIT License (MIT)
//
// https://github.com/OceanPositive/Coral

import CoralUI
import OneWay
import SwiftUI

public struct LineSorterBuilder: ViewBuildable {
    public init() {}

    @MainActor
    public func callAsFunction(
        _ dependency: LineSorterDependency
    ) -> AnyView {
        let store = ViewStore(
            reducer: LineSorterReducer(),
            state: .init(
                input: "",
                output: "",
                lineSortType: .alphabetically,
                orderType: .ordered
            )
        )
        return AnyView(LineSorterScreen(store: store))
    }
}
