// The MIT License (MIT)
//
// https://github.com/OceanPositive/Coral

import MarkdownUI
import OneWay
import SwiftUI

public struct MarkdownPreviewScreen: View {
    @StateObject private var store: ViewStore<MarkdownPreviewReducer>

    init(store: ViewStore<MarkdownPreviewReducer>) {
        self._store = StateObject(wrappedValue: store)
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
                get: { store.state.input },
                set: { store.send(.edit(input: $0)) }
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
            Markdown(store.state.input)
                .markdownTheme(.basic)
                .padding(24)
        }
    }
}

#Preview{
    let store = ViewStore(
        reducer: MarkdownPreviewReducer(),
        state: .init(input: "")
    )
    return MarkdownPreviewScreen(store: store)
}
