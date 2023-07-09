// The MIT License (MIT)
//
// https://github.com/DevYeom/Coral

import AppKit
import CaseConverterInterface
import CoralUI
import OneWay
import SwiftUI

public struct CaseConverterScreen: View {

    @StateObject private var way: CaseConverterWay

    public init(way: CaseConverterWay) {
        self._way = StateObject<CaseConverterWay>(wrappedValue: way)
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 40) {
            menuStack

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

    var menuStack: some View {
        HStack(alignment: .center, spacing: 8) {
            ForEach(CaseConverterType.allCases) {
                converterTypeToggle($0)
            }
        }
    }

    func converterTypeToggle(_ type: CaseConverterType) -> some View {
        Toggle(
            type.title,
            isOn: Binding<Bool>(
                get: { way.state.converterType == type },
                set: { value in
                    guard value else { return }
                    withAnimation {
                        way.send(.updateType(type: type))
                    }
                }
            )
        )
        .toggleStyle(.button)
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

struct CaseConverterScreen_Previews: PreviewProvider {

    static var previews: some View {
        CaseConverterScreen(
            way: .init(initialState: .init(input: "", output: "", converterType: .camel))
        )
    }

}
