// The MIT License (MIT)
//
// https://github.com/OceanPositive/Coral

import CoralUI
import OneWay
import SwiftUI

public struct CaseConverterBuilder: ViewBuildable {
    public init() {}

    @MainActor
    public func callAsFunction(
        _ dependency: CaseConverterDependency
    ) -> AnyView {
        let store = ViewStore(
            reducer: CaseConverterReducer(),
            state: .init(
                input: dependency.input,
                output: dependency.output,
                converterType: dependency.converterType
            )
        )
        return AnyView(CaseConverterScreen(store: store))
    }
}
