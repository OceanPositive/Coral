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
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }

}

struct JSONFormatterScreen_Previews: PreviewProvider {

    static var previews: some View {
        JSONFormatterScreen(
            way: JSONFormatterWay(
                initialState: .init(title: "")
            )
        )
    }

}
