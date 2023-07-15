// The MIT License (MIT)
//
// https://github.com/DevYeom/Coral

import MarkdownUI
import SwiftUI

public struct MarkdownPreviewScreen: View {

    @StateObject private var way: MarkdownPreviewWay

    init(way: MarkdownPreviewWay) {
        self._way = StateObject(wrappedValue: way)
    }

    public var body: some View {
        HStack {

            Section("Input") {
                inputEditor
            }
            .frame(maxWidth: .infinity)
            .focusSection()

            Section("Output") {
                markdownView
            }
            .frame(maxWidth: .infinity)
            .focusSection()

        }
        .padding(24)
    }

    var inputEditor: some View {
        TextEditor(
            text: Binding<String>(
                get: { way.state.input },
                set: { way.send(.edit(input: $0)) }
            )
        )
        .font(.body)
        .background(Color.clear)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(24)
        .background(RoundedRectangle(cornerRadius: 16).strokeBorder(Color.gray))
        .frame(minHeight: 200)
    }

    var markdownView: some View {
        ScrollView {
            Markdown(way.state.input)
                .markdownTheme(.basic)
                .padding(24)
        }
    }

}

struct MarkdownPreviewScreen_Previews: PreviewProvider {

    static var previews: some View {
        let way = MarkdownPreviewWay(
            initialState: .init(input: "")
        )
        return MarkdownPreviewScreen(way: way)
    }

}
