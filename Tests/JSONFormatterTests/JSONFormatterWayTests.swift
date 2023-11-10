// The MIT License (MIT)
//
// https://github.com/OceanPositive/Coral

import CoralKit
import Foundation
import XCTest

@testable import JSONFormatter

final class JSONFormatterWayTests: XCTestCase {
    var sut: JSONFormatterWay!

    override func setUp() {
        sut = nil
    }

    func test_edit() {
        let state = JSONFormatterWay.State(
            input: "",
            output: ""
        )
        sut = JSONFormatterWay(initialState: state)

        do {
            let input = "Hello World"
            sut.send(.edit(input: input))

            XCTAssertEqual(
                sut.state.output,
                StringFormatter.prettyPrintJSON(input)
            )
        }

        do {
            let input = "{\"Hello\": \"World\"}"
            sut.send(.edit(input: input))

            XCTAssertEqual(
                sut.state.output,
                StringFormatter.prettyPrintJSON(input)
            )
        }
    }
}
