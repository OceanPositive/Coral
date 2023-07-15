// The MIT License (MIT)
//
// https://github.com/DevYeom/Coral

import CoralUI
import JSONFormatterInterface
import OneWay
import SwiftUI

public struct JSONFormatterScreen: View {

    @StateObject private var way: JSONFormatterWay

    public init(way: JSONFormatterWay) {
        self._way = StateObject<JSONFormatterWay>(wrappedValue: way)
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
                get: { way.state.input },
                set: { way.send(.edit(input: $0)) }
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
                Text(way.state.output)
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
            way.send(.copyOutput)
        }
        .padding(24)
    }

}

struct JSONFormatterScreen_Previews: PreviewProvider {

    static var previews: some View {
        JSONFormatterScreen(
            way: JSONFormatterWay(
                initialState: .init(
                    input: "",
                    output: ""
                )
            )
        )
    }

}
