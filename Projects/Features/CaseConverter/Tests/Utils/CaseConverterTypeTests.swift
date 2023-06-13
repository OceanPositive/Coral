// The MIT License (MIT)
//
// https://github.com/DevYeom/Coral

import XCTest

@testable import CaseConverter

final class CaseConverterTypeTests: XCTestCase {

    func testConvertToCamel() {
        do {
            let input = "abc"
            let result = CaseConverterType.camel.convert(input)
            XCTAssertEqual(result, "abc")
        }

        do {
            let input = "alreadyCamelCase"
            let result = CaseConverterType.camel.convert(input)
            XCTAssertEqual(result, "alreadyCamelCase")
        }

        do {
            let input = "this_is_snake_case"
            let result = CaseConverterType.camel.convert(input)
            XCTAssertEqual(result, "thisIsSnakeCase")
        }

        do {
            let input = "CONSTANT_CASE"
            let result = CaseConverterType.camel.convert(input)
            XCTAssertEqual(result, "constantCase")
        }

        do {
            let input = "parameter-case"
            let result = CaseConverterType.camel.convert(input)
            XCTAssertEqual(result, "parameterCase")
        }

        do {
            let input = "PascalCase"
            let result = CaseConverterType.camel.convert(input)
            XCTAssertEqual(result, "pascalCase")
        }

        do {
            let input = "tokenToken_token-token"
            let result = CaseConverterType.camel.convert(input)
            XCTAssertEqual(result, "tokenTokenTokenToken")
        }

        do {
            let input =
                """
                camelCase
                onMultiline
                """
            let result = CaseConverterType.camel.convert(input)
            XCTAssertEqual(
                result,
                """
                camelCase
                onMultiline
                """
            )
        }

        do {
            let input =
                """
                camel_case
                on_multiline
                """
            let result = CaseConverterType.camel.convert(input)
            XCTAssertEqual(
                result,
                """
                camelCase
                onMultiline
                """
            )
        }
    }

    func testConvertToSnake() {
        do {
            let input = "abc"
            let result = CaseConverterType.snake.convert(input)
            XCTAssertEqual(result, "abc")
        }

        do {
            let input = "already_snake_case"
            let result = CaseConverterType.snake.convert(input)
            XCTAssertEqual(result, "already_snake_case")
        }

        do {
            let input = "camelToSnake"
            let result = CaseConverterType.snake.convert(input)
            XCTAssertEqual(result, "camel_to_snake")
        }

        do {
            let input = "CONSTANT_CASE"
            let result = CaseConverterType.snake.convert(input)
            XCTAssertEqual(result, "constant_case")
        }

        do {
            let input = "parameter-case"
            let result = CaseConverterType.snake.convert(input)
            XCTAssertEqual(result, "parameter_case")
        }

        do {
            let input = "PascalCase"
            let result = CaseConverterType.snake.convert(input)
            XCTAssertEqual(result, "pascal_case")
        }

        do {
            let input = "tokenToken_token-token"
            let result = CaseConverterType.snake.convert(input)
            XCTAssertEqual(result, "token_token_token_token")
        }

        do {
            let input =
                """
                camelCase
                onMultiline
                """
            let result = CaseConverterType.snake.convert(input)
            XCTAssertEqual(
                result,
                """
                camel_case
                on_multiline
                """
            )
        }
    }

    func testConvertToParameter() {
        do {
            let input = "abc"
            let result = CaseConverterType.parameter.convert(input)
            XCTAssertEqual(result, "abc")
        }

        do {
            let input = "already-parameter-case"
            let result = CaseConverterType.parameter.convert(input)
            XCTAssertEqual(result, "already-parameter-case")
        }

        do {
            let input = "camelToParameter"
            let result = CaseConverterType.parameter.convert(input)
            XCTAssertEqual(result, "camel-to-parameter")
        }

        do {
            let input = "CONSTANT_CASE"
            let result = CaseConverterType.parameter.convert(input)
            XCTAssertEqual(result, "constant-case")
        }

        do {
            let input = "snake_case"
            let result = CaseConverterType.parameter.convert(input)
            XCTAssertEqual(result, "snake-case")
        }

        do {
            let input = "PascalCase"
            let result = CaseConverterType.parameter.convert(input)
            XCTAssertEqual(result, "pascal-case")
        }

        do {
            let input = "tokenToken_token-token"
            let result = CaseConverterType.parameter.convert(input)
            XCTAssertEqual(result, "token-token-token-token")
        }
    }

    func testConvertToConstant() {
        do {
            let input = "abc"
            let result = CaseConverterType.constant.convert(input)
            XCTAssertEqual(result, "ABC")
        }

        do {
            let input = "ALREADY_CONSTANT_CASE"
            let result = CaseConverterType.constant.convert(input)
            XCTAssertEqual(result, "ALREADY_CONSTANT_CASE")
        }

        do {
            let input = "camelToConstant"
            let result = CaseConverterType.constant.convert(input)
            XCTAssertEqual(result, "CAMEL_TO_CONSTANT")
        }

        do {
            let input = "snake_case"
            let result = CaseConverterType.constant.convert(input)
            XCTAssertEqual(result, "SNAKE_CASE")
        }

        do {
            let input = "parameter-case"
            let result = CaseConverterType.constant.convert(input)
            XCTAssertEqual(result, "PARAMETER_CASE")
        }

        do {
            let input = "PascalCase"
            let result = CaseConverterType.constant.convert(input)
            XCTAssertEqual(result, "PASCAL_CASE")
        }

        do {
            let input = "tokenToken_token-token"
            let result = CaseConverterType.constant.convert(input)
            XCTAssertEqual(result, "TOKEN_TOKEN_TOKEN_TOKEN")
        }
    }

    func testConvertToPascal() {
        do {
            let input = "abc"
            let result = CaseConverterType.pascal.convert(input)
            XCTAssertEqual(result, "Abc")
        }

        do {
            let input = "AlreadyPascalCase"
            let result = CaseConverterType.pascal.convert(input)
            XCTAssertEqual(result, "AlreadyPascalCase")
        }

        do {
            let input = "camelToPascal"
            let result = CaseConverterType.pascal.convert(input)
            XCTAssertEqual(result, "CamelToPascal")
        }

        do {
            let input = "snake_case"
            let result = CaseConverterType.pascal.convert(input)
            XCTAssertEqual(result, "SnakeCase")
        }

        do {
            let input = "parameter-case"
            let result = CaseConverterType.pascal.convert(input)
            XCTAssertEqual(result, "ParameterCase")
        }

        do {
            let input = "CONSTANT_CASE"
            let result = CaseConverterType.pascal.convert(input)
            XCTAssertEqual(result, "ConstantCase")
        }

        do {
            let input = "tokenToken_token-token"
            let result = CaseConverterType.pascal.convert(input)
            XCTAssertEqual(result, "TokenTokenTokenToken")
        }
    }
}
