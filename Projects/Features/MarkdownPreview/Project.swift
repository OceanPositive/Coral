// The MIT License (MIT)
//
// https://github.com/DevYeom/Coral

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.static(
    name: "MarkdownPreview",
    packages: [],
    baseSettings: [:],
    dependencies: [
        .common(.coralKit),
        .common(.coralUI),
        .external(.factory),
        .external(.oneWay),
        .external(.markdownUI),
    ],
    hasContainer: true,
    includeExample: true
)
