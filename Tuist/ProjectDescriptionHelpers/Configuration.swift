// The MIT License (MIT)
//
// https://github.com/DevYeom/Coral

import ProjectDescription

extension Array where Element == Configuration {

    static let appConfiguration: [Configuration] = [
        .debug(
            name: "Debug",
            settings: [
                "CORAL_BUNDLE_IDENTIFIER": "com.enuf.Coral.debug",
                "CORAL_DISPLAY_NAME": "Coral(debug)",
                "CODE_SIGN_STYLE": "Automatic",
                "DEVELOPMENT_TEAM": "T42V7M748Y",
            ],
            xcconfig: nil
        ),
        .release(
            name: "Release",
            settings: [
                "CORAL_BUNDLE_IDENTIFIER": "com.enuf.Coral",
                "CORAL_DISPLAY_NAME": "Coral",
                "CODE_SIGN_STYLE": "Automatic",
                "DEVELOPMENT_TEAM": "T42V7M748Y",
            ],
            xcconfig: nil
        ),
    ]

    static func moduleConfiguration(_ name: String) -> [Configuration] {
        [
            .debug(
                name: "Debug",
                settings: [
                    "CORAL_BUNDLE_IDENTIFIER": "com.enuf.Coral.\(name).debug",
                    "CORAL_DISPLAY_NAME": "\(name)(debug)",
                    "CODE_SIGN_STYLE": "Automatic",
                    "DEVELOPMENT_TEAM": "T42V7M748Y",
                ],
                xcconfig: nil
            ),
            .release(
                name: "Release",
                settings: [
                    "CORAL_BUNDLE_IDENTIFIER": "com.enuf.Coral.\(name)",
                    "CORAL_DISPLAY_NAME": "\(name)",
                    "CODE_SIGN_STYLE": "Automatic",
                    "DEVELOPMENT_TEAM": "T42V7M748Y",
                ],
                xcconfig: nil
            ),
        ]
    }

}
