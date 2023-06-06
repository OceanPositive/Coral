// The MIT License (MIT)
//
// https://github.com/DevYeom/Coral

import Foundation
import OneWay

final class ColorConverterWay: Way<ColorConverterWay.Action, ColorConverterWay.State> {

    enum Action {
        case didAppear
    }

    struct State: Equatable {
        var test: String
    }

    override func reduce(state: inout State, action: Action) -> SideWay<Action, Never> {
        switch action {
        case .didAppear:
            state.test = "Appeared!"
            return .none
        }
    }

}
