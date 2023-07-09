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

    static func dynamic(
        name: String,
        packages: [Package],
        baseSettings: SettingsDictionary,
        sources: SourceFilesList? = ["Sources/**"],
        resources: ResourceFileElements? = ["Resources/**"],
        dependencies: [TargetDependency],
        hasContainer: Bool,
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
            sources: sources,
            resources: resources,
            dependencies: dependencies,
            hasContainer: hasContainer,
            includeExample: includeExample
        )
    }

    static func `static`(
        name: String,
        packages: [Package],
        baseSettings: SettingsDictionary,
        sources: SourceFilesList? = ["Sources/**"],
        resources: ResourceFileElements? = nil,
        dependencies: [TargetDependency],
        hasContainer: Bool,
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
            product: resources == nil ? .staticLibrary : .staticFramework,
            sources: sources,
            resources: resources,
            dependencies: dependencies,
            hasContainer: hasContainer,
            includeExample: includeExample
        )
    }

    private static func module(
        name: String,
        packages: [Package],
        settings: Settings?,
        product: Product,
        sources: SourceFilesList?,
        resources: ResourceFileElements?,
        dependencies: [TargetDependency],
        hasContainer: Bool,
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
                sources: sources,
                resources: resources,
                dependencies: dependencies,
                hasContainer: hasContainer,
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
