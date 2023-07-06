// The MIT License (MIT)
//
// https://github.com/DevYeom/Coral

import MarkdownPreview
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
        .onAppear {
            MarkdownPreview.hello()
        }
    }

}

struct MarkdownPreviewExampleView_Previews: PreviewProvider {

    static var previews: some View {
        MarkdownPreviewExampleView()
    }

}
