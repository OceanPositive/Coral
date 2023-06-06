// The MIT License (MIT)
//
// https://github.com/DevYeom/Coral

import CaseConverter
import ColorConverterInterface
import CoralKit
import Dependencies
import SwiftUI

struct FeatureList: View {

    @State private var selectedFeature: CoralFeature?
    @Dependency(\.colorConverterBuilder) var colorConverterBuilder

    var title: String {
        guard let selectedFeature else {
            return Constants.appName
        }
        return selectedFeature.title
    }

    var body: some View {
        List(selection: $selectedFeature) {
            ForEach(CoralFeature.allCases) { feature in
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
    }

    @ViewBuilder
    private func makeFeatureScreen(_ feature: CoralFeature) -> some View {
        switch feature {
        case .colorConverter:
            colorConverterBuilder(
                ColorConverterDependency(text: "TODO")
            )

        case .caseConverter:
            CaseConverterScreen(
                way: .init(
                    initialState: .init(input: "", output: "", converterType: .camel)
                )
            )
        }
    }

}

struct FeatureList_Previews: PreviewProvider {

    static var previews: some View {
        FeatureList()
    }

}
