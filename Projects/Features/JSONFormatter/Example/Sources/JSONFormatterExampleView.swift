// The MIT License (MIT)
//
// https://github.com/DevYeom/Coral

import JSONFormatter
import SwiftUI

struct JSONFormatterExampleView: View {

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            JSONFormatter.hello()
        }
    }

}

struct JSONFormatterExampleView_Previews: PreviewProvider {

    static var previews: some View {
        JSONFormatterExampleView()
    }

}
