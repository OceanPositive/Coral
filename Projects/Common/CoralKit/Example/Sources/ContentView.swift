// The MIT License (MIT)
//
// https://github.com/DevYeom/Coral

import SwiftUI
import CoralKit

struct CoralKitExampleView: View {

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            CoralKit.hello()
        }
    }

}

struct CoralKitExampleView_Previews: PreviewProvider {

    static var previews: some View {
        CoralKitExampleView()
    }

}
