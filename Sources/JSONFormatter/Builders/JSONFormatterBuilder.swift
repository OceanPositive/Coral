// The MIT License (MIT)
//
// https://github.com/OceanPositive/Coral

import CoralUI
import OneWay
import SwiftUI

public struct JSONFormatterBuilder: ViewBuildable {
    public init() {}

    @MainActor
    public func callAsFunction(
        _ dependency: JSONFormatterDependency
    ) -> AnyView {
        let store = ViewStore(
            reducer: JSONFormatterReducer(),
            state: .init(
                input: "",
                output: ""
            )
        )
        return AnyView(JSONFormatterScreen(store: store))
    }
}
