// The MIT License (MIT)
//
// https://github.com/DevYeom/Coral

import Foundation
import LineSorterTesting
import XCTest

@testable import LineSorter

final class LineSorterWayTests: XCTestCase {

    func test_import_statements_convert() {
        let state = LineSorterWay.State(
            input: "",
            output: "",
            lineSortType: .alphabetically,
            orderType: .ordered
        )

        let way = LineSorterWay(initialState: state)

        way.send(.edit(input: Mocks.Import.input))

        XCTAssertEqual(way.state.input, Mocks.Import.input)
        XCTAssertEqual(way.state.output, Mocks.Import.alphabetically_ordered)

        way.send(.updateOrderType(type: .reversed))

        XCTAssertEqual(way.state.input, Mocks.Import.input)
        XCTAssertEqual(way.state.output, Mocks.Import.alphabetically_reversed)

        way.send(.updateSortType(type: .length))

        XCTAssertEqual(way.state.input, Mocks.Import.input)
        XCTAssertEqual(way.state.output, Mocks.Import.lenghtly_reversed)

        way.send(.updateOrderType(type: .ordered))

        XCTAssertEqual(way.state.input, Mocks.Import.input)
        XCTAssertEqual(way.state.output, Mocks.Import.lenghtly_ordered)

        way.send(.edit(input: Mocks.Number.input))

        XCTAssertEqual(way.state.input, Mocks.Number.input)
        XCTAssertEqual(way.state.output, Mocks.Number.lenghtly_ordered)
    }

    func test_number_statements_convert() {
        let state = LineSorterWay.State(
            input: "",
            output: "",
            lineSortType: .alphabetically,
            orderType: .ordered
        )

        let way = LineSorterWay(initialState: state)

        way.send(.edit(input: Mocks.Number.input))

        XCTAssertEqual(way.state.input, Mocks.Number.input)
        XCTAssertEqual(way.state.output, Mocks.Number.alphabetically_ordered)

        way.send(.updateOrderType(type: .reversed))

        XCTAssertEqual(way.state.input, Mocks.Number.input)
        XCTAssertEqual(way.state.output, Mocks.Number.alphabetically_reversed)

        way.send(.updateSortType(type: .length))

        XCTAssertEqual(way.state.input, Mocks.Number.input)
        XCTAssertEqual(way.state.output, Mocks.Number.lenghtly_reversed)

        way.send(.updateOrderType(type: .ordered))

        XCTAssertEqual(way.state.input, Mocks.Number.input)
        XCTAssertEqual(way.state.output, Mocks.Number.lenghtly_ordered)

        way.send(.edit(input: Mocks.Import.input))

        XCTAssertEqual(way.state.input, Mocks.Import.input)
        XCTAssertEqual(way.state.output, Mocks.Import.lenghtly_ordered)
    }

}
