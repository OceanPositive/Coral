// The MIT License (MIT)
//
// https://github.com/OceanPositive/Coral

import CoralUI
import SwiftUI

public struct CaseConverterBuilder: ViewBuildable {
    public init() {}

    public func callAsFunction(
        _ dependency: CaseConverterDependency
    ) -> AnyView {
        let way = CaseConverterWay(
            initialState: .init(
                input: dependency.input,
                output: dependency.output,
                converterType: dependency.converterType
            )
        )
        return AnyView(CaseConverterScreen(way: way))
    }
}
