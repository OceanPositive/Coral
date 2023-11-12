// The MIT License (MIT)
//
// https://github.com/OceanPositive/Coral

import CoralUI
import OneWay
import SwiftUI

public struct MarkdownPreviewBuilder: ViewBuildable {
    public init() {}

    @MainActor
    public func callAsFunction(
        _ dependency: MarkdownPreviewDependency
    ) -> AnyView {
        let store = ViewStore(
            reducer: MarkdownPreviewReducer(),
            state: .init(input: "")
        )
        return AnyView(MarkdownPreviewScreen(store: store))
    }
}
