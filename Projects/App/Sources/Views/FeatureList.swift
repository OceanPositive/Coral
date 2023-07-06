// The MIT License (MIT)
//
// https://github.com/DevYeom/Coral

import CaseConverter
import ColorConverterInterface
import CoralKit
import Dependencies
import LineSorterInterface
import MarkdownPreview
import MarkdownPreviewInterface
import SwiftUI

struct FeatureList: View {

    @Dependency(\.colorConverterBuilder) var colorConverterBuilder
    @Dependency(\.lineSorterBuilder) var lineSorterBuilder
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
            CaseConverterScreen(
                way: .init(
                    initialState: .init(input: "", output: "", converterType: .camel)
                )
            )

        case .colorConverter:
            colorConverterBuilder(
                ColorConverterDependency(text: "TODO")
            )

        case .lineSorter:
            lineSorterBuilder(
                LineSorterDependency()
            )

        case .markdownPreview:
            EmptyView()
        }
    }

}

struct FeatureList_Previews: PreviewProvider {

    static var previews: some View {
        FeatureList(way: .init(initialState: .init(features: [], searchText: "")))
    }

}
