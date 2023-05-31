// The MIT License (MIT)
//
// https://github.com/DevYeom/Coral

import ProjectDescription

extension Settings {

    static func common(
        _ baseSettings: SettingsDictionary = [:]
    ) -> Settings {
        return .settings(
            base: baseSettings,
            configurations: [
                .debug(
                    name: "Debug",
                    settings: [
                        "SWIFT_ACTIVE_COMPILATION_CONDITIONS": "DEBUG",
                    ],
                    xcconfig: nil
                ),
                .release(
                    name: "Release",
                    settings: [
                        "SWIFT_ACTIVE_COMPILATION_CONDITIONS": "REAL",
                    ],
                    xcconfig: nil
                ),
            ],
            defaultSettings: .recommended
        )
    }

}
