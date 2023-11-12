// The MIT License (MIT)
//
// https://github.com/OceanPositive/Coral

import AppKit
import CoralUI
import OneWay
import SwiftUI

public struct CaseConverterScreen: View {
    @StateObject private var store: ViewStore<CaseConverterReducer>

    public init(store: ViewStore<CaseConverterReducer>) {
        self._store = StateObject(wrappedValue: store)
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
                get: { store.state.converterType == type },
                set: { value in
                    guard value else { return }
                    withAnimation {
                        store.send(.updateType(type: type))
                    }
                }
            )
        )
        .toggleStyle(.button)
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
        reducer: CaseConverterReducer(),
        state: .init(
            input: "",
            output: "",
            converterType: .camel
        )
    )
    return CaseConverterScreen(store: store)
}
