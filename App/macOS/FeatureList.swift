// The MIT License (MIT)
//
// https://github.com/OceanPositive/Coral

import CaseConverter
import ColorConverter
import CoralKit
import Factory
import JSONFormatter
import LineSorter
import MarkdownPreview
import SwiftUI

struct FeatureList: View {
    @Injected(\.caseConverterBuilder) private var caseConverterBuilder
    @Injected(\.colorConverterBuilder) private var colorConverterBuilder
    @Injected(\.jsonFormatterBuilder) private var jsonFormatterBuilder
    @Injected(\.lineSorterBuilder) private var lineSorterBuilder
    @Injected(\.markdownPreviewBuilder) private var markdownPreviewBuilder

    @StateObject private var way: FeatureListWay

    init(way: FeatureListWay) {
        self._way = .init(wrappedValue: way)
    }

    var title: String {
        way.state.selectedFeature?.title ?? Constants.appName
    }

    var body: some View {
        List(
            selection: Binding<CoralFeature?>(
                get: { way.state.selectedFeature },
                set: { way.send(.select($0)) }
            )
        ) {
            ForEach(way.state.features) { feature in
                NavigationLink {
                    makeFeatureScreen(feature)
                } label: {
                    Text(feature.title)
                }
                .tag(feature)
            }
        }
        .navigationTitle(title)
        .frame(minWidth: 200)
        .searchable(
            text: Binding<String>(
                get: { way.state.searchText },
                set: { way.send(.search($0)) }
            ),
            placement: .sidebar,
            prompt: "Search"
        )
    }

    @ViewBuilder
    private func makeFeatureScreen(_ feature: CoralFeature) -> some View {
        switch feature {
        case .caseConverter:
            caseConverterBuilder(
                CaseConverterDependency(
                    input: "",
                    output: "",
                    converterType: .camel
                )
            )

        case .colorConverter:
            colorConverterBuilder(
                ColorConverterDependency(text: "TODO")
            )

        case .jsonFormatter:
            jsonFormatterBuilder(
                JSONFormatterDependency()
            )

        case .lineSorter:
            lineSorterBuilder(
                LineSorterDependency()
            )

        case .markdownPreview:
            markdownPreviewBuilder(
                MarkdownPreviewDependency()
            )
        }
    }

}

#Preview {
    FeatureList(way: .init(initialState: .init(features: [], searchText: "")))
}
