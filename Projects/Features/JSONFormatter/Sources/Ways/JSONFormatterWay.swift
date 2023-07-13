// The MIT License (MIT)
//
// https://github.com/DevYeom/Coral

import CoralKit
import Foundation
import JSONFormatterInterface
import OneWay

public final class JSONFormatterWay: Way<JSONFormatterWay.Action, JSONFormatterWay.State> {

    public enum Action {
        case hello
    }

    public struct State: Equatable {
        var title: String

        public init(
            title: String
        ) {
            self.title = title
        }
    }

    public override func reduce(state: inout State, action: Action) -> SideWay<Action, Never> {
        switch action {
        case .hello:
            state.title = "world"
            return .none
        }
    }

}
