// The MIT License (MIT)
//
// https://github.com/OceanPositive/Coral

import CoralKit
import Foundation
import OneWay

final class LineSorterWay: Way<LineSorterWay.Action, LineSorterWay.State> {

    enum Action {
        case edit(input: String)
        case convert
        case updateSortType(type: LineSortType)
        case updateOrderType(type: OrderType)
        case copyOutput
    }

    struct State: Equatable {
        var input: String
        var output: String
        var lineSortType: LineSortType
        var orderType: OrderType
    }

    override func reduce(state: inout State, action: Action) -> SideWay<Action, Never> {
        switch action {
        case let .edit(input):
            state.input = input
            return .just(.convert)

        case .convert:
            state.output = convert(state)
            return .none

        case let .updateSortType(type):
            state.lineSortType = type
            return .just(.convert)

        case let .updateOrderType(type):
            state.orderType = type
            return .just(.convert)

        case .copyOutput:
            DeviceUtil.Pastboard.saveOnPasteboard(state.output)
            return .none
        }
    }

    private func convert(_ state: State) -> String {
        var inputs = state.input.split(whereSeparator: \.isNewline)

        switch state.lineSortType {
        case .alphabetically:
            inputs.sort()

        case .length:
            inputs.sort { $0.count < $1.count }
        }

        switch state.orderType {
        case .ordered:
            return inputs.joined(separator: "\n")

        case .reversed:
            return inputs.reversed().joined(separator: "\n")
        }
    }

}

public enum LineSortType: String, Identifiable, CaseIterable {
    case alphabetically
    case length

    public var id: LineSortType { self }
}

public enum OrderType: String, Identifiable, CaseIterable {
    case ordered
    case reversed

    public var id: OrderType { self }
}
