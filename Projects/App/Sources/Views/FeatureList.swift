// The MIT License (MIT)
//
// https://github.com/DevYeom/Coral

import ColorConverter
import CoralKit
import SwiftUI

struct FeatureList: View {

    @State private var selectedFeature: CoralFeature?

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
                    routeToFeatureView(feature)
                } label: {
                    Text(feature.title)
                }
                .tag(feature)
            }
        }
        .navigationTitle(title)
        .frame(minWidth: 200)
    }

    private func routeToFeatureView(_ feature: CoralFeature) -> some View {
        switch feature {
        case .colorConverter:
            return ColorConverterView()
        }
    }

}

struct FeatureList_Previews: PreviewProvider {

    static var previews: some View {
        FeatureList()
    }

}
