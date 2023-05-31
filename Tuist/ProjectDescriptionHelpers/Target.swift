// The MIT License (MIT)
//
// https://github.com/DevYeom/Coral

import ProjectDescription

extension Array where Element == Target {

    static func appTargets(
        name: String,
        infoPlist: InfoPlist,
        entitlements: Path?,
        dependencies: [TargetDependency]
    ) -> [Target] {
        return [
            .app(
                name: name,
                infoPlist: infoPlist,
                entitlements: entitlements,
                dependencies: dependencies
            ),
            .appTests(name: name),
        ]
    }

    static func moduleTargets(
        name: String,
        product: Product,
        dependencies: [TargetDependency],
        includeExample: Bool
    ) -> [Target] {
        var targets: [Target] = [
            .module(
                name: name,
                product: product,
                dependencies: dependencies
            ),
            .interface(name: name),
            .testing(name: name),
            .tests(name: name),
        ]

        if includeExample {
            targets.append(.example(name: name))
        }

        return targets
    }

}

// MARK: - App

extension Target {

    fileprivate static func app(
        name: String,
        infoPlist: InfoPlist,
        entitlements: Path?,
        dependencies: [TargetDependency]
    ) -> Self {
        Target(
            name: name,
            platform: .macOS,
            product: .app,
            productName: name,
            bundleId: "$(CORAL_BUNDLE_IDENTIFIER)",
            deploymentTarget: .app,
            infoPlist: infoPlist,
            sources: ["Sources/**"],
            resources: ["Resources/**"],
            copyFiles: nil,
            headers: nil,
            entitlements: entitlements,
            scripts: [],
            dependencies: dependencies,
            settings: .common(),
            coreDataModels: [],
            environment: [:],
            launchArguments: [],
            additionalFiles: []
        )
    }

    fileprivate static func appTests(name: String) -> Self {
        Target(
            name: "\(name)Tests",
            platform: .macOS,
            product: .unitTests,
            productName: nil,
            bundleId: Coral.bundleId("\(name)Tests"),
            deploymentTarget: .app,
            infoPlist: .default,
            sources: ["Tests/**"],
            resources: [],
            copyFiles: nil,
            headers: nil,
            entitlements: nil,
            scripts: [],
            dependencies: [
                .target(name: name),
                .xctest,
            ],
            settings: .common(),
            coreDataModels: [],
            environment: [:],
            launchArguments: [],
            additionalFiles: []
        )
    }

}

// MARK: - Module

extension Target {

    fileprivate static func module(
        name: String,
        product: Product,
        dependencies: [TargetDependency]
    ) -> Self {
        Target(
            name: name,
            platform: .macOS,
            product: product,
            productName: name,
            bundleId: Coral.bundleId(name),
            deploymentTarget: .app,
            infoPlist: .default,
            sources: ["Sources/**"],
            resources: ["Resources/**"],
            copyFiles: nil,
            headers: nil,
            entitlements: nil,
            scripts: [],
            dependencies: dependencies + [ .target(name: "\(name)Interface") ],
            settings: .common(),
            coreDataModels: [],
            environment: [:],
            launchArguments: [],
            additionalFiles: []
        )
    }

    fileprivate static func interface(name: String) -> Self {
        Target(
            name: "\(name)Interface",
            platform: .macOS,
            product: .framework,
            productName: nil,
            bundleId: Coral.bundleId("\(name)Interface"),
            deploymentTarget: .app,
            infoPlist: .default,
            sources: ["Interface/**"],
            resources: [],
            copyFiles: nil,
            headers: nil,
            entitlements: nil,
            scripts: [],
            dependencies: [],
            settings: .common(),
            coreDataModels: [],
            environment: [:],
            launchArguments: [],
            additionalFiles: []
        )
    }

    fileprivate static func tests(name: String) -> Self {
        Target(
            name: "\(name)Tests",
            platform: .macOS,
            product: .unitTests,
            productName: nil,
            bundleId: Coral.bundleId("\(name)Tests"),
            deploymentTarget: .app,
            infoPlist: .default,
            sources: ["Tests/**"],
            resources: [],
            copyFiles: nil,
            headers: nil,
            entitlements: nil,
            scripts: [],
            dependencies: [
                .target(name: name),
                .target(name: "\(name)Testing"),
                .xctest,
            ],
            settings: .common(),
            coreDataModels: [],
            environment: [:],
            launchArguments: [],
            additionalFiles: []
        )
    }

    fileprivate static func testing(name: String) -> Self {
        Target(
            name: "\(name)Testing",
            platform: .macOS,
            product: .staticLibrary,
            productName: nil,
            bundleId: Coral.bundleId("\(name)Testing"),
            deploymentTarget: .app,
            infoPlist: .default,
            sources: ["Testing/**"],
            resources: [],
            copyFiles: nil,
            headers: nil,
            entitlements: nil,
            scripts: [],
            dependencies: [
                .target(name: "\(name)Interface"),
            ],
            settings: .common(),
            coreDataModels: [],
            environment: [:],
            launchArguments: [],
            additionalFiles: []
        )
    }

    fileprivate static func example(name: String) -> Self {
        Target(
            name: "\(name)Example",
            platform: .macOS,
            product: .app,
            productName: nil,
            bundleId: Coral.bundleId("\(name)Example"),
            deploymentTarget: .app,
            infoPlist: .default,
            sources: ["Example/Sources/**"],
            resources: ["Example/Resources/**"],
            copyFiles: nil,
            headers: nil,
            entitlements: nil,
            scripts: [],
            dependencies: [
                .target(name: name),
                .target(name: "\(name)Testing"),
            ],
            settings: .settings(),
            coreDataModels: [],
            environment: [:],
            launchArguments: [],
            additionalFiles: []
        )
    }

}
