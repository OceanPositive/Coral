// The MIT License (MIT)
//
// https://github.com/OceanPositive/Coral

import CoralKit
import Foundation
import OneWay
import ___VARIABLE_productName___Interface

public final class ___VARIABLE_productName___Way: Way<___VARIABLE_productName___Way.Action, ___VARIABLE_productName___Way.State> {

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

