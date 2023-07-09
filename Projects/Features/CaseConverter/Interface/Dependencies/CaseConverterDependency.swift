// The MIT License (MIT)
//
// https://github.com/DevYeom/Coral

import Foundation

public struct CaseConverterDependency {

    public var input: String
    public var output: String
    public var converterType: CaseConverterType

    public init(
        input: String,
        output: String,
        converterType: CaseConverterType
    ) {
        self.input = input
        self.output = output
        self.converterType = converterType
    }

}
