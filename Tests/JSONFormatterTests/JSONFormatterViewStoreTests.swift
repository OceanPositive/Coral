// The MIT License (MIT)
//
// https://github.com/OceanPositive/Coral

import CoralKit
import Foundation
import XCTest
import OneWay

@testable import JSONFormatter

@MainActor
final class JSONFormatterViewStoreTests: XCTestCase {
    var sut: ViewStore<JSONFormatterReducer>!

    override func setUp() {
        super.setUp()
        sut = ViewStore(
            reducer: JSONFormatterReducer(),
            state: .init(
                input: "",
                output: ""
            )
        )
    }

    override func tearDown() {
        super.tearDown()
        sut = nil
    }

    func test_edit() async {
        sut = ViewStore(
            reducer: JSONFormatterReducer(),
            state: .init(
                input: "",
                output: ""
            )
        )

        do {
            let input = "Hello World"
            sut.send(.edit(input: input))

            await Task.yield()
            try! await Task.sleep(nanoseconds: NSEC_PER_MSEC)

            XCTAssertEqual(
                sut.state.output,
                StringFormatter.prettyPrintJSON(input)
            )
        }

        do {
            let input = "{\"Hello\": \"World\"}"
            sut.send(.edit(input: input))

            await Task.yield()
            try! await Task.sleep(nanoseconds: NSEC_PER_MSEC)

            XCTAssertEqual(
                sut.state.output,
                StringFormatter.prettyPrintJSON(input)
            )
        }
    }
}
