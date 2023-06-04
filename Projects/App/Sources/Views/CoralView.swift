// The MIT License (MIT)
//
// https://github.com/DevYeom/Coral

import SwiftUI

struct CoralView: View {

    var body: some View {
        NavigationView {
            FeatureList()
            Text("Select a feature")
        }
    }

}

struct CoralView_Previews: PreviewProvider {

    static var previews: some View {
        CoralView()
    }

}
