// The MIT License (MIT)
//
// https://github.com/OceanPositive/Coral

import CoralUI
import OneWay
import SwiftUI
import ___VARIABLE_productName___Interface

public struct ___VARIABLE_productName___Screen: View {

    @StateObject private var way: ___VARIABLE_productName___Way

    public init(way: ___VARIABLE_productName___Way) {
        self._way = StateObject<___VARIABLE_productName___Way>(wrappedValue: way)
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

struct ___VARIABLE_productName___Screen_Previews: PreviewProvider {

    static var previews: some View {
        ___VARIABLE_productName___Screen(
            way: ___VARIABLE_productName___Way(
                initialState: .init(title: "")
            )
        )
    }

}
