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
        .external(.factory),
        .external(.oneWay),
        .featureContainer(.caseConverter),
        .featureContainer(.colorConverter),
        .featureContainer(.jsonFormatter),
        .featureContainer(.lineSorter),
        .featureContainer(.markdownPreview),
        .featureInterface(.caseConverter),
        .featureInterface(.colorConverter),
        .featureInterface(.jsonFormatter),
        .featureInterface(.lineSorter),
        .featureInterface(.markdownPreview),
    ]
)
