// The MIT License (MIT)
//
// https://github.com/OceanPositive/Coral

import Foundation

public enum CaseConverterType {
    case snake
    case camel
    case pascal
    case parameter
    case constant
}

extension CaseConverterType: CaseIterable, Identifiable {
    public static var allCases: [CaseConverterType] {
        [
            .snake,
            .camel,
            .pascal,
            .parameter,
            .constant,
        ]
    }

    public var id: String {
        title
    }

    var title: String {
        switch self {
        case .snake: return "🐍 snake_case"
        case .camel: return "🐪 camelCase"
        case .pascal: return "📐 PascalCase"
        case .parameter: return "🅿️ param-case"
        case .constant: return "🔠 CONSTANT_CASE"
        }
    }

    func convert(_ input: String) -> String {
        input.split(whereSeparator: \.isNewline)
            .map { convertLine(String($0)) }
            .joined(separator: "\n")
    }

    func convertLine(_ input: String) -> String {
        switch self {
        case .snake:
            return input.snakeCased()
        case .camel:
            return input.camelCased()
        case .pascal:
            return input.pascalCased()
        case .parameter:
            return input.parameterCased()
        case .constant:
            return input.constantCased()
        }
    }
}
