// The MIT License (MIT)
//
// https://github.com/DevYeom/Coral

import CoralKit
import Foundation
import JSONFormatterInterface
import OneWay

public final class JSONFormatterWay: Way<JSONFormatterWay.Action, JSONFormatterWay.State> {

    public enum Action {
        case edit(input: String)
        case convert
        case copyOutput
    }

    public struct State: Equatable {
        var input: String
        var output: String

        public init(
            input: String,
            output: String
        ) {
            self.input = input
            self.output = output
        }
    }

    public override func reduce(state: inout State, action: Action) -> SideWay<Action, Never> {
        switch action {
        case let .edit(input):
            state.input = input
            return .just(.convert)

        case .convert:
            state.output = StringFormatter.prettyPrintJSON(state.input)
            return .none

        case .copyOutput:
            DeviceUtil.Pastboard.saveOnPasteboard(state.output)
            return .none
        }
    }

}
