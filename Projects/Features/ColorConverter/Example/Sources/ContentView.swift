// The MIT License (MIT)
//
// https://github.com/DevYeom/Coral

import ColorConverter
import SwiftUI

struct ColorConverterExampleView: View {

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            ColorConverter.hello()
        }
    }

}

struct ColorConverterExampleView_Previews: PreviewProvider {

    static var previews: some View {
        ColorConverterExampleView()
    }

}
