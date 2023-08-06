// The MIT License (MIT)
//
// https://github.com/OceanPositive/Coral

import SwiftUI

struct CoralView: View {

    var body: some View {
        NavigationView {
            featureList
            Text("Select a feature")
        }
    }

    var featureList: some View {
        FeatureList(
            way: .init(
                initialState: .init(
                    features: CoralFeature.allCases,
                    searchText: ""
                )
            )
        )
    }

}

struct CoralView_Previews: PreviewProvider {

    static var previews: some View {
        CoralView()
    }

}
