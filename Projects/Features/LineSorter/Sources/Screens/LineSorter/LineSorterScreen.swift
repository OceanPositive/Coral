// The MIT License (MIT)
//
// https://github.com/DevYeom/Coral

import SwiftUI

public struct LineSorterScreen: View {

    @StateObject private var way: LineSorterWay
    @State private var animatesCopy: Bool = false

    init(way: LineSorterWay) {
        self._way = StateObject(wrappedValue: way)
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
                get: { way.state.lineSortType },
                set: {
                    print($0)
                    way.send(.updateSortType(type: $0))
                }
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
                get: { way.state.orderType },
                set: { way.send(.updateOrderType(type: $0)) }
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
        HStack(spacing: 4) {
            Button(
                action: {
                    withAnimation {
                        way.send(.copyOutput)
                        animatesCopy = true

                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            withAnimation {
                                animatesCopy = false
                            }
                        }
                    }
                },
                label: {
                    Image(systemName: animatesCopy ? "checkmark" : "doc.on.doc.fill")
                        .font(Font.body.bold())
                        .imageScale(.large)
                        .foregroundColor(Color.white)
                        .transition(.slide)
                }
            )
            .buttonStyle(.plain)

            if animatesCopy {
                Text("Copied")
                    .font(Font.body.bold())
                    .transition(.move(edge: .trailing).combined(with: .opacity))
            }
        }
        .animation(.easeInOut, value: animatesCopy)
        .clipped()
        .padding(24)
    }
}

struct LineSorterScreen_Previews: PreviewProvider {

    static var previews: some View {
        let way = LineSorterWay(
            initialState: .init(
                input: "",
                output: "",
                lineSortType: .alphabetically,
                orderType: .ordered
            )
        )
        return LineSorterScreen(way: way)
    }

}
