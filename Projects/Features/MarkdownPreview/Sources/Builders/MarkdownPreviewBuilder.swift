// The MIT License (MIT)
//
// https://github.com/DevYeom/Coral

import CoralUI
import MarkdownPreviewInterface
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
