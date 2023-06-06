// The MIT License (MIT)
//
// https://github.com/DevYeom/Coral

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.app(
    name: "Coral",
    packages: [],
    baseSettings: [
        "MARKETING_VERSION": .string(CoralVersion.app),
        "CURRENT_PROJECT_VERSION": .string(CoralVersion.build),
    ],
    infoPlist: .app,
    scripts: [],
    entitlements: .relativeToRoot("Projects/App/Sources/Coral.entitlements"),
    dependencies: [
        .common(.coralKit),
        .common(.coralUI),
        .feature(.colorConverter),
        .feature(.caseConverter),
        .external(.dependencies),
        .external(.oneWay),
    ]
)
