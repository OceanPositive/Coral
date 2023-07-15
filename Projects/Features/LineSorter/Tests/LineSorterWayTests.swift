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
        XCTAssertEqual(way.state.output, Mocks.Import.alphabeticallyOrdered)

        way.send(.updateOrderType(type: .reversed))

        XCTAssertEqual(way.state.input, Mocks.Import.input)
        XCTAssertEqual(way.state.output, Mocks.Import.alphabeticallyReversed)

        way.send(.updateSortType(type: .length))

        XCTAssertEqual(way.state.input, Mocks.Import.input)
        XCTAssertEqual(way.state.output, Mocks.Import.lenghtlyReversed)

        way.send(.updateOrderType(type: .ordered))

        XCTAssertEqual(way.state.input, Mocks.Import.input)
        XCTAssertEqual(way.state.output, Mocks.Import.lenghtlyOrdered)

        way.send(.edit(input: Mocks.Number.input))

        XCTAssertEqual(way.state.input, Mocks.Number.input)
        XCTAssertEqual(way.state.output, Mocks.Number.lenghtlyOrdered)
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
        XCTAssertEqual(way.state.output, Mocks.Number.alphabeticallyOrdered)

        way.send(.updateOrderType(type: .reversed))

        XCTAssertEqual(way.state.input, Mocks.Number.input)
        XCTAssertEqual(way.state.output, Mocks.Number.alphabeticallyReversed)

        way.send(.updateSortType(type: .length))

        XCTAssertEqual(way.state.input, Mocks.Number.input)
        XCTAssertEqual(way.state.output, Mocks.Number.lenghtlyReversed)

        way.send(.updateOrderType(type: .ordered))

        XCTAssertEqual(way.state.input, Mocks.Number.input)
        XCTAssertEqual(way.state.output, Mocks.Number.lenghtlyOrdered)

        way.send(.edit(input: Mocks.Import.input))

        XCTAssertEqual(way.state.input, Mocks.Import.input)
        XCTAssertEqual(way.state.output, Mocks.Import.lenghtlyOrdered)
    }

}
