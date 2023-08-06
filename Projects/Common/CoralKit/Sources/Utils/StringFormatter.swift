// The MIT License (MIT)
//
// https://github.com/OceanPositive/Coral

import Foundation

public enum StringFormatter {

    public static func prettyPrintJSON(_ string: String) -> String {
        let filtered = string.replacingOccurrences(of: "\\", with: "")
            .trimmingCharacters(in: .whitespacesAndNewlines)
        guard let data = filtered.data(using: .utf8),
            let jsonObject = try? JSONSerialization.jsonObject(with: data, options: []),
            let jsonData = try? JSONSerialization.data(
                withJSONObject: jsonObject,
                options: [
                    .prettyPrinted
                ]
            ),
            let prettyPrinted = String(data: jsonData, encoding: .utf8)
        else {
            return "Invalid JSON"
        }
        return prettyPrinted
    }

}
