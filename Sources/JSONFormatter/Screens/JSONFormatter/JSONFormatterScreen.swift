// The MIT License (MIT)
//
// https://github.com/OceanPositive/Coral

import CoralUI
import OneWay
import SwiftUI

public struct JSONFormatterScreen: View {
    @StateObject private var store: ViewStore<JSONFormatterReducer>

    public init(store: ViewStore<JSONFormatterReducer>) {
        self._store = StateObject(wrappedValue: store)
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 40) {
            HStack(alignment: .top, spacing: 16) {
                VStack {
                    Text("Input")
                        .font(.headline)

                    inputEditor
                }

                VStack {
                    Text("Output")
                        .font(.headline)

                    outputText
                }
            }
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
        .foregroundColor(Color.white)
        .padding(24)
        .background(RoundedRectangle(cornerRadius: 16).strokeBorder(Color.gray))
    }

    var outputText: some View {
        ScrollView(.vertical) {
            VStack(spacing: .zero) {
                Text(store.state.output)
                    .textSelection(.enabled)
                    .font(.body)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.leading)

                Spacer()
            }
        }
        .padding(24)
        .background(Color.black.cornerRadius(16))
        .overlay(copyButton, alignment: .bottomTrailing)
    }

    var copyButton: some View {
        CopyButton {
            store.send(.copyOutput)
        }
        .padding(24)
    }
}

#Preview{
    let store = ViewStore(
        reducer: JSONFormatterReducer(),
        state: .init(
            input: "",
            output: ""
        )
    )
    return JSONFormatterScreen(store: store)
}
