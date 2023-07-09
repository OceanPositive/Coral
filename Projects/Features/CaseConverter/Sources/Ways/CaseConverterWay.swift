// The MIT License (MIT)
//
// https://github.com/DevYeom/Coral

import CaseConverterInterface
import CoralKit
import Foundation
import OneWay

public final class CaseConverterWay: Way<CaseConverterWay.Action, CaseConverterWay.State> {

    public enum Action {
        case edit(input: String)
        case convert
        case updateType(type: CaseConverterType)
        case copyOutput
    }

    public struct State: Equatable {
        var input: String
        var output: String
        var converterType: CaseConverterType

        public init(
            input: String,
            output: String,
            converterType: CaseConverterType
        ) {
            self.input = input
            self.output = output
            self.converterType = converterType
        }
    }

    public init(initialState: State) {
        super.init(initialState: initialState)
    }

    public override func reduce(state: inout State, action: Action) -> SideWay<Action, Never> {
        switch action {
        case let .edit(input):
            state.input = input
            return .just(.convert)

        case .convert:
            state.output = state.converterType.convert(state.input)
            return .none

        case let .updateType(type):
            state.converterType = type
            return .just(.convert)

        case .copyOutput:
            DeviceUtil.Pastboard.saveOnPasteboard(state.output)
            return .none
        }
    }

}
