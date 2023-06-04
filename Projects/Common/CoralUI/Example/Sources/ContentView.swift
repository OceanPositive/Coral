// The MIT License (MIT)
//
// https://github.com/DevYeom/Coral

import CoralUI
import SwiftUI

struct CoralUIExampleView: View {

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            CoralUI.hello()
        }
    }

}

struct CoralUIExampleView_Previews: PreviewProvider {

    static var previews: some View {
        CoralUIExampleView()
    }

}
