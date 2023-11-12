// The MIT License (MIT)
//
// https://github.com/OceanPositive/Coral

import Foundation
import XCTest
import OneWay

@testable import LineSorter

@MainActor
final class LineSorterViewStoreTests: XCTestCase {
    var sut: ViewStore<LineSorterReducer>!

    override func setUp() {
        super.setUp()
        sut = ViewStore(
            reducer: LineSorterReducer(),
            state: .init(
                input: "",
                output: "",
                lineSortType: .alphabetically,
                orderType: .ordered
            )
        )
    }

    override func tearDown() {
        super.tearDown()
        sut = nil
    }

    func test_import_statements_convert() async {
        sut.send(.edit(input: Mocks.Import.input))

        await Task.yield()
        try! await Task.sleep(nanoseconds: NSEC_PER_MSEC)

        XCTAssertEqual(sut.state.input, Mocks.Import.input)
        XCTAssertEqual(sut.state.output, Mocks.Import.alphabeticallyOrdered)

        sut.send(.updateOrderType(type: .reversed))

        await Task.yield()
        try! await Task.sleep(nanoseconds: NSEC_PER_MSEC)

        XCTAssertEqual(sut.state.input, Mocks.Import.input)
        XCTAssertEqual(sut.state.output, Mocks.Import.alphabeticallyReversed)

        sut.send(.updateSortType(type: .length))

        await Task.yield()
        try! await Task.sleep(nanoseconds: NSEC_PER_MSEC)

        XCTAssertEqual(sut.state.input, Mocks.Import.input)
        XCTAssertEqual(sut.state.output, Mocks.Import.lenghtlyReversed)

        sut.send(.updateOrderType(type: .ordered))

        await Task.yield()
        try! await Task.sleep(nanoseconds: NSEC_PER_MSEC)

        XCTAssertEqual(sut.state.input, Mocks.Import.input)
        XCTAssertEqual(sut.state.output, Mocks.Import.lenghtlyOrdered)

        sut.send(.edit(input: Mocks.Number.input))

        await Task.yield()
        try! await Task.sleep(nanoseconds: NSEC_PER_MSEC)

        XCTAssertEqual(sut.state.input, Mocks.Number.input)
        XCTAssertEqual(sut.state.output, Mocks.Number.lenghtlyOrdered)
    }

    func test_number_statements_convert() async {
        sut.send(.edit(input: Mocks.Number.input))

        await Task.yield()
        try! await Task.sleep(nanoseconds: NSEC_PER_MSEC)

        XCTAssertEqual(sut.state.input, Mocks.Number.input)
        XCTAssertEqual(sut.state.output, Mocks.Number.alphabeticallyOrdered)

        sut.send(.updateOrderType(type: .reversed))

        await Task.yield()
        try! await Task.sleep(nanoseconds: NSEC_PER_MSEC)

        XCTAssertEqual(sut.state.input, Mocks.Number.input)
        XCTAssertEqual(sut.state.output, Mocks.Number.alphabeticallyReversed)

        sut.send(.updateSortType(type: .length))

        await Task.yield()
        try! await Task.sleep(nanoseconds: NSEC_PER_MSEC)

        XCTAssertEqual(sut.state.input, Mocks.Number.input)
        XCTAssertEqual(sut.state.output, Mocks.Number.lenghtlyReversed)

        sut.send(.updateOrderType(type: .ordered))

        await Task.yield()
        try! await Task.sleep(nanoseconds: NSEC_PER_MSEC)

        XCTAssertEqual(sut.state.input, Mocks.Number.input)
        XCTAssertEqual(sut.state.output, Mocks.Number.lenghtlyOrdered)

        sut.send(.edit(input: Mocks.Import.input))

        await Task.yield()
        try! await Task.sleep(nanoseconds: NSEC_PER_MSEC)

        XCTAssertEqual(sut.state.input, Mocks.Import.input)
        XCTAssertEqual(sut.state.output, Mocks.Import.lenghtlyOrdered)
    }
}
