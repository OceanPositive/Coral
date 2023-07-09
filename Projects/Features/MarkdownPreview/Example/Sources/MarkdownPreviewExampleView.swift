// The MIT License (MIT)
//
// https://github.com/DevYeom/Coral

import Factory
import MarkdownPreviewContainer
import MarkdownPreviewInterface
import SwiftUI

struct MarkdownPreviewExampleView: View {

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }

}

struct MarkdownPreviewExampleView_Previews: PreviewProvider {

    static var previews: some View {
        MarkdownPreviewExampleView()
    }

}
