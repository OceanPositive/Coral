// The MIT License (MIT)
//
// https://github.com/DevYeom/Coral

import CoralKit
import Foundation
import OneWay

final class MarkdownPreviewWay: Way<MarkdownPreviewWay.Action, MarkdownPreviewWay.State> {

    enum Action {
        case edit(input: String)
    }

    struct State: Equatable {
        var input: String
    }

    override func reduce(state: inout State, action: Action) -> SideWay<Action, Never> {
        switch action {
        case let .edit(input):
            state.input = input
            return .none
        }
    }

}
