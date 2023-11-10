// The MIT License (MIT)
//
// https://github.com/OceanPositive/Coral

import CoralUI
import SwiftUI

public struct MarkdownPreviewBuilder: ViewBuildable {
    public init() {}

    public func callAsFunction(
        _ dependency: MarkdownPreviewDependency
    ) -> AnyView {
        let way = MarkdownPreviewWay(
            initialState: .init(input: "")
        )
        return AnyView(MarkdownPreviewScreen(way: way))
    }
}
