// The MIT License (MIT)
//
// https://github.com/DevYeom/Coral

import ProjectDescription

public extension TargetDependency {

    enum Common: String {
        case coralKit = "CoralKit"
        case coralUI = "CoralUI"
    }

    enum Feature: String {
        case caseConverter = "CaseConverter"
        case colorConverter = "ColorConverter"
        case jsonFormatter = "JSONFormatter"
        case lineSorter = "LineSorter"
        case markdownPreview = "MarkdownPreview"

        var container: String { rawValue + "Container" }
        var interface: String { rawValue + "Interface" }
    }

    enum External: String {
        case factory = "Factory"
        case oneWay = "OneWay"
    }

}

public extension TargetDependency {

    static func common(_ target: Common) -> Self {
        return .project(
            target: target.rawValue,
            path: .relativeToRoot("Projects/Common/\(target.rawValue)")
        )
    }

    static func featureContainer(_ target: Feature) -> Self {
        return .project(
            target: target.container,
            path: .relativeToRoot("Projects/Features/\(target.rawValue)")
        )
    }

    static func featureInterface(_ target: Feature) -> Self {
        return .project(
            target: target.interface,
            path: .relativeToRoot("Projects/Features/\(target.rawValue)")
        )
    }

    static func external(_ target: External) -> Self {
        return .external(name: target.rawValue)
    }

}
