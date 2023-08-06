// The MIT License (MIT)
//
// https://github.com/OceanPositive/Coral

import Foundation
import OneWay

final class FeatureListWay: Way<FeatureListWay.Action, FeatureListWay.State> {

    enum Action {
        case search(String)
        case select(CoralFeature?)
    }

    struct State: Equatable {
        var features: [CoralFeature]
        var selectedFeature: CoralFeature?
        var searchText: String
    }

    init(initialState: State) {
        super.init(initialState: initialState)
    }

    override func reduce(state: inout State, action: Action) -> SideWay<Action, Never> {
        switch action {
        case let .search(input):
            state.searchText = input
            state.features = searchedFeatures(input: input)
            return .just(.select(state.features.first))

        case let .select(feature):
            state.selectedFeature = feature
            return .none
        }
    }

}

extension FeatureListWay {

    fileprivate func searchedFeatures(input: String) -> [CoralFeature] {
        guard !input.isEmpty else {
            return CoralFeature.allCases
        }

        return CoralFeature.allCases.filter {
            $0.title.lowercased().contains(input.lowercased())
        }
    }

}
