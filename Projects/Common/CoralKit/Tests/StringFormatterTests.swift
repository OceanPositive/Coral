// The MIT License (MIT)
//
// https://github.com/DevYeom/Coral

import CoralKit
import CoralKitTesting
import Foundation
import XCTest

final class StringFormatterTests: XCTestCase {

    func test_prettyPrintJSON() {
        do {
            let input = "Hello World"
            let output = StringFormatter.prettyPrintJSON(input)

            XCTAssertEqual(output, "Invalid JSON")
        }

        do {
            let input = "[{\"person\": {\"name\":\"Yeom\",\"age\":\"24\"}},{\"person\": {\"name\":\"gaeun\",\"age\":\"70\"}}]"
            let output = StringFormatter.prettyPrintJSON(input)

            XCTAssertEqual(
                output,
                """
                [
                  {
                    "person" : {
                      "name" : "Yeom",
                      "age" : "24"
                    }
                  },
                  {
                    "person" : {
                      "name" : "gaeun",
                      "age" : "70"
                    }
                  }
                ]
                """
            )
        }

        do {
            let input =
                "{\"name\":\"John\",\"age\":30,\"city\":\"New York\",\"pets\":[{\"name\":\"Max\",\"type\":\"dog\"},{\"name\":\"Charlie\",\"type\":\"cat\"}],\"education\":{\"university\":\"Harvard\",\"degree\":\"Computer Science\"},\"hobbies\":[\"reading\",\"traveling\",\"playing guitar\"],\"isEmployed\":true}"
            let output = StringFormatter.prettyPrintJSON(input)

            XCTAssertEqual(
                output,
                """
                {
                  "city" : "New York",
                  "pets" : [
                    {
                      "name" : "Max",
                      "type" : "dog"
                    },
                    {
                      "name" : "Charlie",
                      "type" : "cat"
                    }
                  ],
                  "age" : 30,
                  "hobbies" : [
                    "reading",
                    "traveling",
                    "playing guitar"
                  ],
                  "education" : {
                    "university" : "Harvard",
                    "degree" : "Computer Science"
                  },
                  "isEmployed" : true,
                  "name" : "John"
                }
                """
            )
        }
    }

}
