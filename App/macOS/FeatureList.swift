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
import OneWay

struct FeatureList: View {
    @Injected(\.caseConverterBuilder) private var caseConverterBuilder
    @Injected(\.colorConverterBuilder) private var colorConverterBuilder
    @Injected(\.jsonFormatterBuilder) private var jsonFormatterBuilder
    @Injected(\.lineSorterBuilder) private var lineSorterBuilder
    @Injected(\.markdownPreviewBuilder) private var markdownPreviewBuilder

    @StateObject private var store: ViewStore<FeatureListReducer>

    init(store: ViewStore<FeatureListReducer>) {
        self._store = StateObject(wrappedValue: store)
    }

    var title: String {
        store.state.selectedFeature?.title ?? Constants.appName
    }

    var body: some View {
        List(
            selection: Binding<CoralFeature?>(
                get: { store.state.selectedFeature },
                set: { store.send(.select($0)) }
            )
        ) {
            ForEach(store.state.features) { feature in
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
                get: { store.state.searchText },
                set: { store.send(.search($0)) }
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
    let store = ViewStore(
        reducer: FeatureListReducer(),
        state: .init(
            features: CoralFeature.allCases,
            searchText: ""
        )
    )
    return FeatureList(store: store)
}
