// The MIT License (MIT)
//
// https://github.com/OceanPositive/Coral

import ProjectDescription

let dependencies = Dependencies(
    carthage: nil,
    swiftPackageManager: SwiftPackageManagerDependencies(
        [
            .remote(
                url: "https://github.com/hmlongco/Factory.git",
                requirement: .upToNextMajor(from: "2.0.0")
            ),
            .remote(
                url: "https://github.com/gonzalezreal/swift-markdown-ui",
                requirement: .upToNextMajor(from: "2.0.0")
            ),
            .remote(
                url: "https://github.com/DevYeom/OneWay.git",
                requirement: .upToNextMajor(from: "1.0.0")
            ),
        ],
        productTypes: [
            "Factory": .framework,
            "MarkdownUI" : .staticFramework,
            "OneWay": .framework,
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
