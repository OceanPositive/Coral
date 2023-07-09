// The MIT License (MIT)
//
// https://github.com/DevYeom/Coral

import Foundation

extension String {

    func tokenized() -> [String] {
        return capitalSeparated()
            .lowercased()
            .components(separatedBy: [" ", "_", "-"])
    }

    func capitalSeparated() -> String {
        guard let regex = try? NSRegularExpression(pattern: "([a-z]+)([A-Z])") else {
            return self
        }
        return
            regex
            .stringByReplacingMatches(
                in: self,
                range: NSRange(0 ..< utf16.count),
                withTemplate: "$1 $2"
            )
            .trimmingCharacters(in: .whitespacesAndNewlines)
    }

    func snakeCased() -> String {
        tokenized()
            .map { $0.lowercased() }
            .joined(separator: "_")
    }

    func camelCased() -> String {
        var tokenized = tokenized()
        let first = tokenized.removeFirst()
        return first + tokenized.map(\.capitalized).joined()
    }

    func parameterCased() -> String {
        tokenized()
            .joined(separator: "-")
    }

    func constantCased() -> String {
        tokenized()
            .map { $0.uppercased() }
            .joined(separator: "_")
    }

    func pascalCased() -> String {
        tokenized().map(\.capitalized).joined()
    }

}
