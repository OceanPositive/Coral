// The MIT License (MIT)
//
// https://github.com/OceanPositive/Coral

import CoralKit
import Foundation
import OneWay

final class MarkdownPreviewReducer: Reducer {
    enum Action {
        case edit(input: String)
    }

    struct State: Equatable {
        var input: String
    }

    func reduce(state: inout State, action: Action) -> AnyEffect<Action> {
        switch action {
        case let .edit(input):
            state.input = input
            return .none
        }
    }
}
