// The MIT License (MIT)
//
// https://github.com/DevYeom/Coral

import ProjectDescription

public extension Project {

    static func app(
        name: String,
        packages: [Package],
        baseSettings: SettingsDictionary,
        infoPlist: InfoPlist,
        scripts: [TargetScript],
        entitlements: Path?,
        dependencies: [TargetDependency]
    ) -> Self {
        return Project(
            name: name,
            organizationName: Coral.organizationName,
            options: .options(),
            packages: packages,
            settings: .settings(
                base: baseSettings,
                configurations: .appConfiguration,
                defaultSettings: .recommended
            ),
            targets: .appTargets(
                name: name,
                infoPlist: infoPlist,
                entitlements: entitlements,
                dependencies: dependencies
            ),
            schemes: [
                .debug(name: name),
                .release(name: name),
            ],
            fileHeaderTemplate: .string(Coral.fileHeader),
            additionalFiles: [],
            resourceSynthesizers: [
                .assets(),
                .strings(),
            ]
        )
    }

    static func dynamicFramework(
        name: String,
        packages: [Package],
        baseSettings: SettingsDictionary,
        dependencies: [TargetDependency],
        includeExample: Bool
    ) -> Self {
        return module(
            name: name,
            packages: packages,
            settings: .settings(
                base: baseSettings,
                configurations: .moduleConfiguration(name),
                defaultSettings: .recommended
            ),
            product: .framework,
            dependencies: dependencies,
            includeExample: includeExample
        )
    }

    static func staticFramework(
        name: String,
        packages: [Package],
        baseSettings: SettingsDictionary,
        dependencies: [TargetDependency],
        includeExample: Bool
    ) -> Self {
        return module(
            name: name,
            packages: packages,
            settings: .settings(
                base: baseSettings,
                configurations: .moduleConfiguration(name),
                defaultSettings: .recommended
            ),
            product: .staticFramework,
            dependencies: dependencies,
            includeExample: includeExample
        )
    }

    private static func module(
        name: String,
        packages: [Package],
        settings: Settings?,
        product: Product,
        dependencies: [TargetDependency],
        includeExample: Bool
    ) -> Self {
        return Project(
            name: name,
            organizationName: nil,
            options: .options(),
            packages: packages,
            settings: settings,
            targets: .moduleTargets(
                name: name,
                product: product,
                dependencies: dependencies,
                includeExample: includeExample
            ),
            schemes: [
                .debug(name: name),
                .release(name: name),
            ],
            fileHeaderTemplate: .string(Coral.fileHeader),
            additionalFiles: [],
            resourceSynthesizers: .default
        )
    }

}
