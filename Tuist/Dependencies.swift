// The MIT License (MIT)
//
// https://github.com/DevYeom/Coral

import ProjectDescription

let dependencies = Dependencies(
    carthage: nil,
    swiftPackageManager: SwiftPackageManagerDependencies(
        [
            .remote(url: "https://github.com/DevYeom/OneWay.git", requirement: .upToNextMajor(from: "1.0.0")),
            .remote(url: "https://github.com/pointfreeco/swift-dependencies", requirement: .upToNextMajor(from: "0.1.0")),
        ],
        productTypes: [
            "OneWay": .framework,
            "Dependencies": .framework,
        ],
        baseSettings: .settings(
            configurations: [
                .debug(name: "Debug", settings: [:], xcconfig: nil),
                .release(name: "Release", settings: [:], xcconfig: nil),
            ]
        ),
        targetSettings: [:],
        projectOptions: [:]
    ),
    platforms: [.macOS]
)
