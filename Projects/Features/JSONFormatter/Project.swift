// The MIT License (MIT)
//
// https://github.com/DevYeom/Coral

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.static(
    name: "JSONFormatter",
    packages: [],
    baseSettings: [:],
    dependencies: [
        .common(.coralKit),
        .common(.coralUI),
        .external(.dependencies),
        .external(.oneWay),
    ],
    includeExample: true
)
