// The MIT License (MIT)
//
// https://github.com/OceanPositive/Coral

import CoralUI
import OneWay
import SwiftUI

public struct LineSorterScreen: View {
    @StateObject private var store: ViewStore<LineSorterReducer>

    init(store: ViewStore<LineSorterReducer>) {
        self._store = StateObject(wrappedValue: store)
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 40) {
            VStack(alignment: .leading) {
                typePicker

                orderPicker
            }

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

    var typePicker: some View {
        Picker(
            "Type",
            selection: Binding<LineSortType>(
                get: { store.state.lineSortType },
                set: { store.send(.updateSortType(type: $0)) }
            )
        ) {
            ForEach(LineSortType.allCases) {
                Text($0.rawValue)
            }
        }
        .pickerStyle(.segmented)
        .frame(width: 200)
        .padding()

    }

    var orderPicker: some View {
        Picker(
            "Order",
            selection: Binding<OrderType>(
                get: { store.state.orderType },
                set: { store.send(.updateOrderType(type: $0)) }
            )
        ) {
            ForEach(OrderType.allCases) {
                Text($0.rawValue)
            }
        }
        .pickerStyle(.segmented)
        .frame(width: 200)
        .padding()
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
        reducer: LineSorterReducer(),
        state: .init(
            input: "",
            output: "",
            lineSortType: .alphabetically,
            orderType: .ordered
        )
    )
    return LineSorterScreen(store: store)
}
