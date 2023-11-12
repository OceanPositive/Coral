// The MIT License (MIT)
//
// https://github.com/OceanPositive/Coral

import SwiftUI
import OneWay

struct CoralView: View {
    var body: some View {
        NavigationView {
            featureList
            Text("Select a feature")
        }
    }

    @MainActor
    var featureList: some View {
        let store = ViewStore(
            reducer: FeatureListReducer(),
            state: .init(
                features: CoralFeature.allCases,
                searchText: ""
            )
        )
        return FeatureList(store: store)
    }
}

#Preview {
    CoralView()
}
