// The MIT License (MIT)
//
// https://github.com/OceanPositive/Coral

import CaseConverter
import CoralUI
import ColorConverter
import Factory
import JSONFormatter
import LineSorter
import MarkdownPreview

extension Container: AutoRegistering {
    public func autoRegister() {
    }
}

extension Container {
    var caseConverterBuilder: Factory<AnyViewBuilder<CaseConverterDependency>> {
        self { AnyViewBuilder(CaseConverterBuilder()) }
    }

    var colorConverterBuilder: Factory<AnyViewBuilder<ColorConverterDependency>> {
        self { AnyViewBuilder(ColorConverterBuilder()) }
    }

    var jsonFormatterBuilder: Factory<AnyViewBuilder<JSONFormatterDependency>> {
        self { AnyViewBuilder(JSONFormatterBuilder()) }
    }

    var lineSorterBuilder: Factory<AnyViewBuilder<LineSorterDependency>> {
        self { AnyViewBuilder(LineSorterBuilder()) }
    }

    var markdownPreviewBuilder: Factory<AnyViewBuilder<MarkdownPreviewDependency>> {
        self { AnyViewBuilder(MarkdownPreviewBuilder()) }
    }
}
