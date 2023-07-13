// The MIT License (MIT)
//
// https://github.com/DevYeom/Coral

import CoralUI
import SwiftUI
import ___VARIABLE_productName___Interface

public struct ___VARIABLE_productName___Builder: ViewBuildable {

    public init() {}

    public func callAsFunction(
        _ dependency: ___VARIABLE_productName___Dependency
    ) -> AnyView {
        let way = ___VARIABLE_productName___Way(
            initialState: .init(title: "")
        )
        return AnyView(___VARIABLE_productName___Screen(way: way))
    }

}
