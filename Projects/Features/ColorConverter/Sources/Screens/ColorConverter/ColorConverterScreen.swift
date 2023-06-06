// The MIT License (MIT)
//
// https://github.com/DevYeom/Coral

import SwiftUI

public struct ColorConverterScreen: View {

    @StateObject private var way: ColorConverterWay

    init(way: ColorConverterWay) {
        self._way = StateObject(wrappedValue: way)
    }

    public var body: some View {
        Text(way.state.test)
            .font(.title)
            .onAppear {
                way.send(.didAppear)
            }
    }

}

struct ColorConverterView_Previews: PreviewProvider {

    static var previews: some View {
        let way = ColorConverterWay(
            initialState: .init(
                test: "Hello World!"
            )
        )
        return ColorConverterScreen(way: way)
    }

}
