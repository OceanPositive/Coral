// The MIT License (MIT)
//
// https://github.com/DevYeom/Coral

import CoralUI
import Factory
import Foundation
import MarkdownPreview
import MarkdownPreviewInterface

public final class MarkdownPreviewContainer: SharedContainer {

    public static let shared = MarkdownPreviewContainer()
    public let manager = ContainerManager()

}

extension MarkdownPreviewContainer {

    public var markdownPreviewBuilder: Factory<AnyViewBuilder<MarkdownPreviewDependency>> {
        self { AnyViewBuilder(MarkdownPreviewBuilder()) }
    }

}
