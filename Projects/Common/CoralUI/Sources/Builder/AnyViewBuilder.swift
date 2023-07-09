// The MIT License (MIT)
//
// https://github.com/DevYeom/Coral

import Foundation
import SwiftUI

public struct AnyViewBuilder<Dependency> {

    private let call: (Dependency) -> AnyView

    public init<B: ViewBuildable>(_ builder: B) where B.Dependency == Dependency {
        call = builder.callAsFunction
    }

    public func callAsFunction(_ dependency: Dependency) -> AnyView {
        call(dependency)
    }

}
